using Paladins.Common.Constants;

namespace Paladins.Common.Models
{
    public class ValidationModel
    {
        public bool IsValid { get; set; }
        public string ValidationMessage { get; set; }


        public static ValidationModel Success => new ValidationModel
        {
            IsValid = true,
            ValidationMessage = ValidationMessageConstants.Success
        };
    }
}
