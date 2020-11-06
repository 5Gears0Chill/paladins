using System;

namespace Paladins.Common.Validation.Attributes
{
    [AttributeUsage(AttributeTargets.All, Inherited = false)]
    public class ValidateToMatchId : Attribute
    {
        public ValidateToMatchId()
        {
        }
    }
}
