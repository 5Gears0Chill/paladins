using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Client.Strategies
{
    class DailyLimitRetMessageStrategy : IRetMessageStrategy
    {
        public bool IsApplicable(string message)
        {
            return message
                .ContainsAny(new List<string> 
                { 
                    RetMessageConstants.DailyLimit, 
                    RetMessageConstants.ExceededCap, 
                    RetMessageConstants.RequestLimit 
                }, 
                StringComparison.CurrentCultureIgnoreCase);
        }

        public ErrorResponseModel PropogateModel<TClientResponse>(TClientResponse model) where TClientResponse : BaseClientModel
        {
            return new ErrorResponseModel
            {
                ErrorCode = ErrorCodes.LimitExceeded,
                IsFailedRequest = true,
                Message = "Daily limit Exceeded"
            };
        }
    }
}
