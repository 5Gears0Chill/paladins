using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Validation
{
    public class ValidationResponse
    {
        public ValidatorResult ValidatonResults{ get; set; }

        public ValidationResponse()
        {
            ValidatonResults = new ValidatorResult();
        }
    }
}
