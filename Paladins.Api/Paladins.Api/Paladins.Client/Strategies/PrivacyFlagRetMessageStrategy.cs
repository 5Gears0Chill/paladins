using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;

namespace Paladins.Client.Strategies
{
    public class PrivacyFlagRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message
                .ToLower()
                .Trim()
                .Contains(RetMessageConstants.Privacy);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                Message = "The requested player has set their privacy status to active. The requested information is private",
                IsFailedRequest = true,
                ErrorCode = 1000
            };
        }
    }
}
