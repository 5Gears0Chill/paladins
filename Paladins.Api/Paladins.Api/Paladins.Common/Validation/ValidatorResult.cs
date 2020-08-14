using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Paladins.Common.Validation
{
    public class ValidatorResult
    {
        public bool IsValid => !ErrorMessages.Any();

        public List<string> ErrorMessages { get; set; }

        public ValidatorResult()
            :this(new List<string>())
        {

        }

        public ValidatorResult(List<string> errorMessages)
        {
            ErrorMessages = errorMessages;
        }
    }
}
