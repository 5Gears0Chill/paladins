using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Validation;
using Paladins.Common.Models;
using Paladins.Common.Validation.Attributes;
using System;

namespace Paladins.Common.Validation.Validators
{
    public class MatchIdValidator : IValidator
    {
        public bool IsApplicable(Type attrType)
        {
            return attrType == typeof(ValidateToMatchId);
        }

        public ValidationModel Validate(object value)
        {
            var isValid = int.TryParse(value.ToString(), out _);
            return new ValidationModel
            {
                IsValid = isValid,
                ValidationMessage = isValid ? ValidationMessageConstants.Success : ValidationMessageConstants.InValidMatchId,
            };
        }
    }
}
