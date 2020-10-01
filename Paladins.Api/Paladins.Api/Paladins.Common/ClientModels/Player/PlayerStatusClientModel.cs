using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerStatusClientModel: BaseClientModel
    {
        [JsonProperty("Match")]
        public long Match { get; set; }

        [JsonProperty("personal_status_message")]
        public object PersonalStatusMessage { get; set; }

        [JsonProperty("status")]
        public long Status { get; set; }

        [JsonProperty("status_string")]
        public string StatusString { get; set; }
    }
}
