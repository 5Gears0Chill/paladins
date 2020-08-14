using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerLoadoutsClientModel
    {
        [JsonProperty("ChampionId")]
        public long ChampionId { get; set; }

        [JsonProperty("ChampionName")]
        public string ChampionName { get; set; }

        [JsonProperty("DeckId")]
        public long DeckId { get; set; }

        [JsonProperty("DeckName")]
        public string DeckName { get; set; }

        [JsonProperty("LoadoutItems")]
        public List<LoadoutItem> LoadoutItems { get; set; }

        [JsonProperty("playerId")]
        public long PlayerId { get; set; }

        [JsonProperty("playerName")]
        public string PlayerName { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }

    public partial class LoadoutItem
    {
        [JsonProperty("ItemId")]
        public long ItemId { get; set; }

        [JsonProperty("ItemName")]
        public string ItemName { get; set; }

        [JsonProperty("Points")]
        public long Points { get; set; }
    }
}
