using Microsoft.AspNetCore.Http;
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
