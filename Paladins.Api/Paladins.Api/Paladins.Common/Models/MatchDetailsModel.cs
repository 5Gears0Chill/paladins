using System.Collections.Generic;

namespace Paladins.Common.Models
{
    public class MatchDetailsModel
    {
        public int PaladinsMatchId { get; set; }
        public int PaladinsQueueId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public string MapName { get; set; }
        public string PlayerName { get; set; }
        public int PlayerAccountLevel { get; set; }
        public string MapGameType { get; set; }
        public string HasReplay { get; set; }
        public int Length { get; set; }
        public int LengthInMinutes { get; set; }
        public string WinStatus { get; set; }
        public string Region { get; set; }
        public int TeamOneScore { get; set; }
        public int TeamTwoScore { get; set; }
        public int PaladinsChampionId { get; set; }
        public int PaladinsChampionSkinId { get; set; }
        public int SelfHealing { get; set; }
        public int GoldEarnedPerMinute { get; set; }
        public int GoldEarnedTotal { get; set; }
        public int HealingDone { get; set; }
        public int DamageDoneInHand { get; set; }
        public int DamageTaken { get; set; }
        public int DamageMitigated { get; set; }
        public int Deaths { get; set; }
        public int Kills { get; set; }
        public int KillingSpree { get; set; }
        public int KillsDouble { get; set; }
        public int KillsTriple { get; set; }
        public int KillsQuadra { get; set; }
        public int KillsPenta { get; set; }
        public int MultiKillMax { get; set; }
        public int LeagueLosses { get; set; }
        public int LeageWins { get; set; }
        public int LeagueTier { get; set; }
        public int LeaguePoints { get; set; }
        public IEnumerable<MatchBansModel> MatchBans { get; set; }
        public IEnumerable<ItemsBoughtModel> ItemsBought { get; set; }
        public IEnumerable<LoadoutSelectedModel> LoadoutSelected { get; set; }
    }
}
