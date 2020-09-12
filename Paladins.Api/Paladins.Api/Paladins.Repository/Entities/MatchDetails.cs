using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class MatchDetails : AuditBaseEntity
    {
        public MatchDetails()
        {
            ItemsBought = new HashSet<ItemsBought>();
            LoadoutSelectedMatchDetails = new HashSet<LoadoutSelected>();
            LoadoutSelectedPmatch = new HashSet<LoadoutSelected>();
            MatchBansMatchDetails = new HashSet<MatchBans>();
            MatchBansPmatch = new HashSet<MatchBans>();
        }

        public int PmatchId { get; set; }
        public int PqueueId { get; set; }
        public int PplayerId { get; set; }
        public int PlayerMatchHistoryId { get; set; }
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
        public int PchampionId { get; set; }
        public int PchampionSkinId { get; set; }
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
        public int? LeageWins { get; set; }
        public int LeagueTier { get; set; }
        public int LeaguePoints { get; set; }

        public virtual Tier LeagueTierNavigation { get; set; }
        public virtual Queue Pqueue { get; set; }
        public virtual PlayerMatchHistory PlayerMatchHistory { get; set; }
        public virtual ICollection<ItemsBought> ItemsBought { get; set; }
        public virtual ICollection<LoadoutSelected> LoadoutSelectedMatchDetails { get; set; }
        public virtual ICollection<LoadoutSelected> LoadoutSelectedPmatch { get; set; }
        public virtual ICollection<MatchBans> MatchBansMatchDetails { get; set; }
        public virtual ICollection<MatchBans> MatchBansPmatch { get; set; }
    }
}
