using Paladins.Common.ErrorHandling.Exceptions;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Validation;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Paladins.Common.Validation
{
    public class ResponseValidator : IResponseValidator
    {
        private readonly IAttributeValidationResolver _attributeValidationResolver;
        private readonly List<Type> _attributeTypes;

        public ResponseValidator(IAttributeValidationResolver attributeValidationResolver, 
            IValidationAttributeList validationAttributeList)
        {
            _attributeValidationResolver = attributeValidationResolver;
            _attributeTypes = validationAttributeList.AttributeTypes;
        }

        public ValidationModel Validate<T>(T classInstance)
        {
            var dict = classInstance.AsDictionary();
            foreach (var prop in dict)
            {
                var customAttr = typeof(T).GetProperty(prop.Key).GetCustomAttributes();
                if (customAttr.Any())
                {
                    var propAttr = _attributeTypes.Where(x => x == customAttr.First().GetType()).FirstOrDefault();
                    if (propAttr.IsNull()) { throw new MalformedValidationAttributeException(customAttr.First().GetType());}
                    var isDefined = Attribute.IsDefined(typeof(T).GetProperty(prop.Key), propAttr);
                    if (isDefined)
                    {
                        var validator = _attributeValidationResolver.Resolve(propAttr);
                        var validationResult = validator.Validate(prop.Value);
                        return validationResult;
                    }
                }
            }
            return ValidationModel.Success;
        }

        public ValidatorResult Map(ValidationModel model)
        {
            var messages = !model.IsValid ? model.ValidationMessage.AsStringList() : new List<string>();
            return new ValidatorResult
            {
                ErrorMessages = messages
            };
        }
    }
}
