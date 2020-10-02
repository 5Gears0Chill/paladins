using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;

namespace Paladins.Client.Strategies
{
    public class ApprovedRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message.Equals(RetMessageConstants.Approved);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return null;
        }
    }
}
