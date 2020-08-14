using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Requests
{
    public class MatchBatchRequest : BaseRequest
    {
        public List<string> MatchIds { get; set; }
    }
}
