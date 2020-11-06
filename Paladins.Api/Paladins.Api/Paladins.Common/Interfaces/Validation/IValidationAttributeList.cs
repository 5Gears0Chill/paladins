using System;
using System.Collections.Generic;

namespace Paladins.Common.Interfaces.Validation
{
    public interface IValidationAttributeList
    {
        public List<Type> AttributeTypes { get; }
    }
}
