using Newtonsoft.Json;

namespace Paladins.Common.ClientModels.General
{
    public partial class GeneralChampionsSkinsClientModel
    {
        [JsonProperty("champion_id")]
        public long ChampionId { get; set; }

        [JsonProperty("champion_name")]
        public string ChampionName { get; set; }

        [JsonProperty("rarity")]
        public string Rarity { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }

        [JsonProperty("skin_id1")]
        public long SkinId1 { get; set; }

        [JsonProperty("skin_id2")]
        public long SkinId2 { get; set; }

        [JsonProperty("skin_name")]
        public string SkinName { get; set; }

        [JsonProperty("skin_name_english")]
        public string SkinNameEnglish { get; set; }
    }
}
