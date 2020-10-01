using Paladins.Common.Builders;
using Paladins.Common.ErrorHandling.Exceptions;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Resolvers;
using System;
using System.Collections.Generic;

namespace Paladins.Common.ErrorHandling.Resolvers
{
    public class ErrorCodeResolver : IErrorCodeResolver
    {
        public Dictionary<int, Type> dict = new Dictionary<int, Type>();


        public ErrorCodeResolver()
        {
            BuildDictionary();
        }

        public Exception Resolve(int code, string message)
        {
            var type = dict[code];
            if(type.IsNotNull()) return ObjectCreator.NewInstance<Exception>(type, new object[] { message });
            return new UnResolvedException(code);
        }

        private void BuildDictionary()
        {
            dict.Add(1000, typeof(PlayerPrivacyException));
        }
    }
}
