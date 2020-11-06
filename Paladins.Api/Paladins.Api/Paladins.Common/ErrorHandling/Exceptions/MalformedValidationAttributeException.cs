using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class MalformedValidationAttributeException : Exception
    {
        public MalformedValidationAttributeException(Type attributeType)
           : base($"The attribute type {attributeType} has not been defined")
        {
        }
    }
}
