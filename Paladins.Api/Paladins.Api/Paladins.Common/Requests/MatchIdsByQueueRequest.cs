using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Requests
{
    public class MatchIdsByQueueRequest: BaseRequest
    {
        public string Queue { get; set; }
        public string Date { get; set; }
        public string Hour { get; set; }
    }
}
