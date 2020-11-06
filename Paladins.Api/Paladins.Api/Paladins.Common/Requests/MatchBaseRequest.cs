using Paladins.Common.Validation.Attributes;
using System;
using System.Collections.Generic;

namespace Paladins.Common.Requests
{
    public class MatchBaseRequest: BaseRequest
    {
        [ValidateToMatchId]
        public string MatchId { get; set; }
        public int PlayerMatchHistoryId { get; set; }
    } 
}
