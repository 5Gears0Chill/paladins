using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Validation
{
    public class ValidationResponse
    {
        public ValidatorResult ValidationResults{ get; set; }

        public ValidationResponse()
        {
            ValidationResults = new ValidatorResult();
        }
    }
}
