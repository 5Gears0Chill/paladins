using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerStatusClientModel
    {
        [JsonProperty("Match")]
        public long Match { get; set; }

        [JsonProperty("personal_status_message")]
        public object PersonalStatusMessage { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }

        [JsonProperty("status")]
        public long Status { get; set; }

        [JsonProperty("status_string")]
        public string StatusString { get; set; }
    }
}
