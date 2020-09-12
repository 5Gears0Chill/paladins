using Newtonsoft.Json;
using Paladins.Common.Converters;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Match
{

    public partial class MatchDetailsClientModel
    {
        [JsonProperty("Account_Level")]
        public long AccountLevel { get; set; }

        [JsonProperty("ActiveId1")]
        public long ActiveId1 { get; set; }

        [JsonProperty("ActiveId2")]
        public long ActiveId2 { get; set; }

        [JsonProperty("ActiveId3")]
        public long ActiveId3 { get; set; }

        [JsonProperty("ActiveId4")]
        public long ActiveId4 { get; set; }

        [JsonProperty("ActiveLevel1")]
        public long ActiveLevel1 { get; set; }

        [JsonProperty("ActiveLevel2")]
        public long ActiveLevel2 { get; set; }

        [JsonProperty("ActiveLevel3")]
        public long ActiveLevel3 { get; set; }

        [JsonProperty("ActiveLevel4")]
        public long ActiveLevel4 { get; set; }

        [JsonProperty("Assists")]
        public long Assists { get; set; }

        [JsonProperty("BanId1")]
        public long BanId1 { get; set; }

        [JsonProperty("BanId2")]
        public long BanId2 { get; set; }

        [JsonProperty("BanId3")]
        public long BanId3 { get; set; }

        [JsonProperty("BanId4")]
        public long BanId4 { get; set; }

        [JsonProperty("Ban_1")]
        public object Ban1 { get; set; }

        [JsonProperty("Ban_2")]
        public object Ban2 { get; set; }

        [JsonProperty("Ban_3")]
        public object Ban3 { get; set; }

        [JsonProperty("Ban_4")]
        public object Ban4 { get; set; }

        [JsonProperty("Camps_Cleared")]
        public long CampsCleared { get; set; }

        [JsonProperty("ChampionId")]
        public long ChampionId { get; set; }

        [JsonProperty("Damage_Bot")]
        public long DamageBot { get; set; }

        [JsonProperty("Damage_Done_In_Hand")]
        public long DamageDoneInHand { get; set; }

        [JsonProperty("Damage_Done_Magical")]
        public long DamageDoneMagical { get; set; }

        [JsonProperty("Damage_Done_Physical")]
        public long DamageDonePhysical { get; set; }

        [JsonProperty("Damage_Mitigated")]
        public long DamageMitigated { get; set; }

        [JsonProperty("Damage_Player")]
        public long DamagePlayer { get; set; }

        [JsonProperty("Damage_Taken")]
        public long DamageTaken { get; set; }

        [JsonProperty("Damage_Taken_Magical")]
        public long DamageTakenMagical { get; set; }

        [JsonProperty("Damage_Taken_Physical")]
        public long DamageTakenPhysical { get; set; }

        [JsonProperty("Deaths")]
        public long Deaths { get; set; }

        [JsonProperty("Distance_Traveled")]
        public long DistanceTraveled { get; set; }

        [JsonProperty("Entry_Datetime")]
        public string EntryDatetime { get; set; }

        [JsonProperty("Final_Match_Level")]
        public long FinalMatchLevel { get; set; }

        [JsonProperty("Gold_Earned")]
        public long GoldEarned { get; set; }

        [JsonProperty("Gold_Per_Minute")]
        public long GoldPerMinute { get; set; }

        [JsonProperty("Healing")]
        public long Healing { get; set; }

        [JsonProperty("Healing_Bot")]
        public long HealingBot { get; set; }

        [JsonProperty("Healing_Player_Self")]
        public long HealingPlayerSelf { get; set; }

        [JsonProperty("ItemId1")]
        public long ItemId1 { get; set; }

        [JsonProperty("ItemId2")]
        public long ItemId2 { get; set; }

        [JsonProperty("ItemId3")]
        public long ItemId3 { get; set; }

        [JsonProperty("ItemId4")]
        public long ItemId4 { get; set; }

        [JsonProperty("ItemId5")]
        public long ItemId5 { get; set; }

        [JsonProperty("ItemId6")]
        public long ItemId6 { get; set; }

        [JsonProperty("ItemLevel1")]
        public long ItemLevel1 { get; set; }

        [JsonProperty("ItemLevel2")]
        public long ItemLevel2 { get; set; }

        [JsonProperty("ItemLevel3")]
        public long ItemLevel3 { get; set; }

        [JsonProperty("ItemLevel4")]
        public long ItemLevel4 { get; set; }

        [JsonProperty("ItemLevel5")]
        public long ItemLevel5 { get; set; }

        [JsonProperty("ItemLevel6")]
        public long ItemLevel6 { get; set; }

        [JsonProperty("Item_Active_1")]
        public string ItemActive1 { get; set; }

        [JsonProperty("Item_Active_2")]
        public string ItemActive2 { get; set; }

        [JsonProperty("Item_Active_3")]
        public string ItemActive3 { get; set; }

        [JsonProperty("Item_Active_4")]
        public string ItemActive4 { get; set; }

        [JsonProperty("Item_Purch_1")]
        public string ItemPurch1 { get; set; }

        [JsonProperty("Item_Purch_2")]
        public string ItemPurch2 { get; set; }

        [JsonProperty("Item_Purch_3")]
        public string ItemPurch3 { get; set; }

        [JsonProperty("Item_Purch_4")]
        public string ItemPurch4 { get; set; }

        [JsonProperty("Item_Purch_5")]
        public string ItemPurch5 { get; set; }

        [JsonProperty("Item_Purch_6")]
        public string ItemPurch6 { get; set; }

        [JsonProperty("Killing_Spree")]
        public long KillingSpree { get; set; }

        [JsonProperty("Kills_Bot")]
        public long KillsBot { get; set; }

        [JsonProperty("Kills_Double")]
        public long KillsDouble { get; set; }

        [JsonProperty("Kills_Fire_Giant")]
        public long KillsFireGiant { get; set; }

        [JsonProperty("Kills_First_Blood")]
        public long KillsFirstBlood { get; set; }

        [JsonProperty("Kills_Gold_Fury")]
        public long KillsGoldFury { get; set; }

        [JsonProperty("Kills_Penta")]
        public long KillsPenta { get; set; }

        [JsonProperty("Kills_Phoenix")]
        public long KillsPhoenix { get; set; }

        [JsonProperty("Kills_Player")]

        public long KillsPlayer { get; set; }
        [JsonProperty("Kills")]
        public long Kills { get; set; }

        [JsonProperty("Kills_Quadra")]
        public long KillsQuadra { get; set; }

        [JsonProperty("Kills_Siege_Juggernaut")]
        public long KillsSiegeJuggernaut { get; set; }

        [JsonProperty("Kills_Single")]
        public long KillsSingle { get; set; }

        [JsonProperty("Kills_Triple")]
        public long KillsTriple { get; set; }

        [JsonProperty("Kills_Wild_Juggernaut")]
        public long KillsWildJuggernaut { get; set; }

        [JsonProperty("League_Losses")]
        public long LeagueLosses { get; set; }

        [JsonProperty("League_Points")]
        public long LeaguePoints { get; set; }

        [JsonProperty("League_Tier")]
        public long LeagueTier { get; set; }

        [JsonProperty("League_Wins")]
        public long LeagueWins { get; set; }

        [JsonProperty("Map_Game")]
        public string MapGame { get; set; }

        [JsonProperty("Mastery_Level")]
        public long MasteryLevel { get; set; }

        [JsonProperty("Match")]
        public long Match { get; set; }

        [JsonProperty("Minutes")]
        public long Minutes { get; set; }

        [JsonProperty("Multi_kill_Max")]
        public long MultiKillMax { get; set; }

        [JsonProperty("Objective_Assists")]
        public long ObjectiveAssists { get; set; }

        [JsonProperty("PartyId")]
        public long PartyId { get; set; }

        [JsonProperty("Rank_Stat_League")]
        public long RankStatLeague { get; set; }

        [JsonProperty("Reference_Name")]
        public string ReferenceName { get; set; }

        [JsonProperty("Region")]
        public string Region { get; set; }

        [JsonProperty("Skin")]
        public string Skin { get; set; }

        [JsonProperty("SkinId")]
        public long SkinId { get; set; }

        [JsonProperty("Structure_Damage")]
        public long StructureDamage { get; set; }

        [JsonProperty("Surrendered")]
        public long Surrendered { get; set; }

        [JsonProperty("TaskForce")]
        public long TaskForce { get; set; }

        [JsonProperty("Team1Score")]
        public long Team1Score { get; set; }

        [JsonProperty("Team2Score")]
        public long Team2Score { get; set; }

        [JsonProperty("TeamId")]
        public long TeamId { get; set; }

        [JsonProperty("Team_Name")]
        public string TeamName { get; set; }

        [JsonProperty("Time_In_Match_Seconds")]
        public long TimeInMatchSeconds { get; set; }

        [JsonProperty("Towers_Destroyed")]
        public long TowersDestroyed { get; set; }

        [JsonProperty("Wards_Placed")]
        public long WardsPlaced { get; set; }

        [JsonProperty("Win_Status")]
        public string WinStatus { get; set; }

        [JsonProperty("Winning_TaskForce")]
        public long WinningTaskForce { get; set; }

        [JsonProperty("hasReplay")]
        public string HasReplay { get; set; }

        [JsonProperty("match_queue_id")]
        public long MatchQueueId { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("playerId")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long PlayerId { get; set; }

        [JsonProperty("playerName")]
        public string PlayerName { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }
}
