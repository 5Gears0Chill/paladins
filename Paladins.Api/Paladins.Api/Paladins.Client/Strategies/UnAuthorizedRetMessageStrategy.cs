using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using System;

namespace Paladins.Client.Strategies
{
    public class UnAuthorizedRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message.Contains(RetMessageConstants.UnAuthorized, StringComparison.CurrentCultureIgnoreCase);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                ErrorCode = ErrorCodes.UnAuthorized,
                IsFailedRequest = true,
                Message = "The developer account is restricted from the Paladins API"
            };
        }
    }
}
