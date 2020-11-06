using Paladins.Common.Models;
using System;

namespace Paladins.Common.Interfaces.Validation
{
    public interface IValidator
    {
        public bool IsApplicable(Type attrType);
        public ValidationModel Validate(object value);
    }
}
