using Paladins.Common.ClientModels;
using Paladins.Common.Models;

namespace Paladins.Common.Interfaces.Strategies
{
    public interface IRetMessageStrategy
    {
        bool IsApplicable(string message);
        ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel;
    }
}
