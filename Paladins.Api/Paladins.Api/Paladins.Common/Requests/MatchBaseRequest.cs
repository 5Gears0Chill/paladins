using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Requests
{
    public class MatchBaseRequest: BaseRequest
    {
        public string MatchId { get; set; }
        public int PlayerMatchHistoryId { get; set; }
    }
}
