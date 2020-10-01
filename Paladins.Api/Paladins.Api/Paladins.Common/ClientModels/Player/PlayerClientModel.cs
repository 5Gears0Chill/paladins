using Newtonsoft.Json;
using Paladins.Common.Converters;
using System;
using System.Collections.Generic;

namespace Paladins.Common.ClientModels.Player
{
    public partial class PlayerClientModel : BaseClientModel
    {
        [JsonProperty("ActivePlayerId")]
        public long ActivePlayerId { get; set; }

        [JsonProperty("AvatarId")]
        public long AvatarId { get; set; }

        [JsonProperty("AvatarURL")]
        public Uri AvatarUrl { get; set; }

        [JsonProperty("Created_Datetime")]
        public string CreatedDatetime { get; set; }

        [JsonProperty("HoursPlayed")]
        public long HoursPlayed { get; set; }

        [JsonProperty("Id")]
        public long Id { get; set; }

        [JsonProperty("Last_Login_Datetime")]
        public string LastLoginDatetime { get; set; }

        [JsonProperty("Leaves")]
        public long Leaves { get; set; }

        [JsonProperty("Level")]
        public long Level { get; set; }

        [JsonProperty("LoadingFrame")]
        public string LoadingFrame { get; set; }

        [JsonProperty("Losses")]
        public long Losses { get; set; }

        [JsonProperty("MasteryLevel")]
        public long MasteryLevel { get; set; }

        [JsonProperty("MergedPlayers")]
        public List<MergedPlayer> MergedPlayers { get; set; }

        [JsonProperty("MinutesPlayed")]
        public long MinutesPlayed { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("Personal_Status_Message")]
        public string PersonalStatusMessage { get; set; }

        [JsonProperty("Platform")]
        public string Platform { get; set; }

        [JsonProperty("RankedConquest")]
        public Ranked RankedConquest { get; set; }

        [JsonProperty("RankedController")]
        public Ranked RankedController { get; set; }

        [JsonProperty("RankedKBM")]
        public Ranked RankedKbm { get; set; }

        [JsonProperty("Region")]
        public string Region { get; set; }

        [JsonProperty("TeamId")]
        public long TeamId { get; set; }

        [JsonProperty("Team_Name")]
        public string TeamName { get; set; }

        [JsonProperty("Tier_Conquest")]
        public long TierConquest { get; set; }

        [JsonProperty("Tier_RankedController")]
        public long TierRankedController { get; set; }

        [JsonProperty("Tier_RankedKBM")]
        public long TierRankedKbm { get; set; }

        [JsonProperty("Title")]
        public string Title { get; set; }

        [JsonProperty("Total_Achievements")]
        public long TotalAchievements { get; set; }

        [JsonProperty("Total_Worshippers")]
        public long TotalWorshippers { get; set; }

        [JsonProperty("Total_XP")]
        public long TotalXp { get; set; }

        [JsonProperty("Wins")]
        public long Wins { get; set; }

        [JsonProperty("hz_gamer_tag")]
        public object HzGamerTag { get; set; }

        [JsonProperty("hz_player_name")]
        public string HzPlayerName { get; set; }
    }

    public partial class MergedPlayer
    {
        [JsonProperty("merge_datetime")]
        public string MergeDatetime { get; set; }

        [JsonProperty("playerId")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PlayerId { get; set; }

        [JsonProperty("portalId")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PortalId { get; set; }
    }

    public partial class Ranked
    {
        [JsonProperty("Leaves")]
        public long Leaves { get; set; }

        [JsonProperty("Losses")]
        public long Losses { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("Points")]
        public long Points { get; set; }

        [JsonProperty("PrevRank")]
        public long PrevRank { get; set; }

        [JsonProperty("Rank")]
        public long Rank { get; set; }

        [JsonProperty("Season")]
        public long Season { get; set; }

        [JsonProperty("Tier")]
        public long Tier { get; set; }

        [JsonProperty("Trend")]
        public long Trend { get; set; }

        [JsonProperty("Wins")]
        public long Wins { get; set; }

        [JsonProperty("player_id")]
        public object PlayerId { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }
}

