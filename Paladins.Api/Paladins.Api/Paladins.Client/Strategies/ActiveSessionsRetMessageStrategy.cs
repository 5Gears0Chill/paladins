using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using System;

namespace Paladins.Client.Strategies
{
    public class ActiveSessionsRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message.Contains(RetMessageConstants.ActiveSessions, StringComparison.CurrentCultureIgnoreCase);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                ErrorCode = ErrorCodes.ActiveSessions,
                IsFailedRequest = true,
                Message = "Maximum Number of Active Sessions Reached"
            };
        }
    }
}
