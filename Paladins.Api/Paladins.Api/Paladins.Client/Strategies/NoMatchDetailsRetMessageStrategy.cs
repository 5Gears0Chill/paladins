using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using System;

namespace Paladins.Client.Strategies
{
    public class NoMatchDetailsRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message.Contains(RetMessageConstants.NoMatchDetails, StringComparison.CurrentCultureIgnoreCase);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                ErrorCode = ErrorCodes.NoMatchDetails,
                IsFailedRequest = true,
                Message = "The current match has no public details"
            };
        }
    }
}
