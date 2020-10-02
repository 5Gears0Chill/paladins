using Newtonsoft.Json;
using Paladins.Common.Converters;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerQueueStatsClientModel: BaseClientModel
    {
        [JsonProperty("Assists")]
        public long Assists { get; set; }

        [JsonProperty("Champion")]
        public string Champion { get; set; }

        [JsonProperty("ChampionId")]
        public long ChampionId { get; set; }

        [JsonProperty("Deaths")]
        public long Deaths { get; set; }

        [JsonProperty("Gold")]
        public long Gold { get; set; }

        [JsonProperty("Kills")]
        public long Kills { get; set; }

        [JsonProperty("LastPlayed")]
        public string LastPlayed { get; set; }

        [JsonProperty("Losses")]
        public long Losses { get; set; }

        [JsonProperty("Matches")]
        public long Matches { get; set; }

        [JsonProperty("Minutes")]
        public long Minutes { get; set; }

        [JsonProperty("Queue")]
        public string Queue { get; set; }

        [JsonProperty("Wins")]
        public long Wins { get; set; }

        [JsonProperty("player_id")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PlayerId { get; set; }

      
    }

}
