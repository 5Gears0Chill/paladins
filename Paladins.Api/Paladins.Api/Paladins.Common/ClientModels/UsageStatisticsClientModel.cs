using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels
{
    public class UsageStatisticsClientModel
    {
        [JsonProperty("Active_Sessions")]
        public long ActiveSessions { get; set; }

        [JsonProperty("Concurrent_Sessions")]
        public long ConcurrentSessions { get; set; }

        [JsonProperty("Request_Limit_Daily")]
        public long RequestLimitDaily { get; set; }

        [JsonProperty("Session_Cap")]
        public long SessionCap { get; set; }

        [JsonProperty("Session_Time_Limit")]
        public long SessionTimeLimit { get; set; }

        [JsonProperty("Total_Requests_Today")]
        public long TotalRequestsToday { get; set; }

        [JsonProperty("Total_Sessions_Today")]
        public long TotalSessionsToday { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }
}
