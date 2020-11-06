using Paladins.Common.Interfaces.Validation;
using System;

namespace Paladins.Common.Interfaces.Resolvers
{
    public interface IAttributeValidationResolver
    {
        IValidator Resolve(Type attrType);
    }
}
