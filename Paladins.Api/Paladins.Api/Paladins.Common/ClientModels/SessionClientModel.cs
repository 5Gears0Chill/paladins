using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels
{
    public class SessionClientModel : BaseClientModel
    {
        public int StatusCode { get; set; }

        [JsonProperty("session_id")]
        public string SessionId { get; set; }

        [JsonProperty("timestamp")]
        public string Timestamp { get; set; }
    }
}
