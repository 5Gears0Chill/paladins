using Microsoft.AspNetCore.Http;
using Paladins.Common.ErrorHandling.Exceptions;
using Paladins.Common.ErrorHandling.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.ErrorHandling.Handlers
{
    public class ErrorType
    {
        public ErrorDictionary<DictionaryObject> dictionary = new ErrorDictionary<DictionaryObject>();
        private Type _exceptionType;
        public ErrorType(Type exceptionType)
        {
            _exceptionType = exceptionType;
        }

        public bool IsError()
        {
            BuildDictionary();
            return dictionary.ContainsType(this._exceptionType);
        }

        private void BuildDictionary()
        {
            //add custom errors here
            dictionary.Add<PlayerPrivacyException>(new DictionaryObject { ResultCode = 1, Title = "Player has turned on privacy", StatusCode = 404 });
            dictionary.Add<UnResolvedException>(new DictionaryObject { ResultCode = 2, Title = "Failed to handle Ret message", StatusCode = 500 });

        }

        public DictionaryObject Get()
        {
            return dictionary.Get(this._exceptionType);
        }

        public Task GenericResponse<K>(HttpContext context, K model)
        {
            return InvokeResponseWithCustomJsonConverter(context, model);
        }

        private Task InvokeResponseWithCustomJsonConverter<K>(HttpContext context, K model)
        {
            return HandleError.WithDefaultJsonConverter(context, model);
        }
    }
}
