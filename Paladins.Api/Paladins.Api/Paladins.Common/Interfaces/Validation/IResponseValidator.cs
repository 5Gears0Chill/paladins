using Paladins.Common.Models;
using Paladins.Common.Validation;

namespace Paladins.Common.Interfaces.Validation
{
    public interface IResponseValidator
    {
        ValidationModel Validate<T>(T classInstance);
        ValidatorResult Map(ValidationModel model);
    }
}
