using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using System;

namespace Paladins.Client.Strategies
{
    public class TimeStampRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message.Contains(RetMessageConstants.TimeStamp, StringComparison.CurrentCultureIgnoreCase);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                ErrorCode = ErrorCodes.Timestamp,
                IsFailedRequest = true,
                Message = "Timestamp mismatch"
            };
        }
    }
}
