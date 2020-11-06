using Paladins.Common.Interfaces.Validation;
using Paladins.Common.Validation.Attributes;
using System;
using System.Collections.Generic;

namespace Paladins.Common.Validation
{
    public class ValidationAttributeList : IValidationAttributeList
    {
        public List<Type> AttributeTypes { get; private set; }

        public ValidationAttributeList()
        {
            AttributeTypes = CreateList();
        }

        private List<Type> CreateList() => new List<Type>
        {
            typeof(ValidateToMatchId),
        };
    }
}
