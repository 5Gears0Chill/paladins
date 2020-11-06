using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Validation;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Common.Resolvers
{
    public class AttributeValidationResolver : IAttributeValidationResolver
    {
        private readonly IEnumerable<IValidator> _validators;

        public AttributeValidationResolver(IEnumerable<IValidator> validators)
        {
            this._validators = validators;
        }

        public IValidator Resolve(Type attrType)
        {
            return _validators.SingleOrDefault(x => x.IsApplicable(attrType));
        }
    }
}
