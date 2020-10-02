using Newtonsoft.Json;
using Paladins.Common.Converters;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Player
{
    public class PlayerFriendsClientModel : BaseClientModel
    {
        [JsonProperty("account_id")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long AccountId { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("player_id")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PlayerId { get; set; }
    }
}
