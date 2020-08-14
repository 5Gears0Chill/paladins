using Newtonsoft.Json;
using Paladins.Common.Converters;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerChampionRanksClientModel
    {
        [JsonProperty("Assists")]
        public long Assists { get; set; }

        [JsonProperty("Deaths")]
        public long Deaths { get; set; }

        [JsonProperty("Kills")]
        public long Kills { get; set; }

        [JsonProperty("Losses")]
        public long Losses { get; set; }

        [JsonProperty("MinionKills")]
        public long MinionKills { get; set; }

        [JsonProperty("Rank")]
        public long Rank { get; set; }

        [JsonProperty("Wins")]
        public long Wins { get; set; }

        [JsonProperty("Worshippers")]
        public long Worshippers { get; set; }

        [JsonProperty("champion")]
        public string Champion { get; set; }

        [JsonProperty("champion_id")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long ChampionId { get; set; }

        [JsonProperty("player_id")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PlayerId { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }
}
