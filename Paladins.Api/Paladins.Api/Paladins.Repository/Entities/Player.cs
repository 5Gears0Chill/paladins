using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Player : AuditBaseEntity
    {
        public Player()
        {
            PlayerChampionStats = new HashSet<PlayerChampionStats>();
            PlayerRankDetails = new HashSet<PlayerRankDetails>();
            Friends = new HashSet<Friend>();
            PlayerMatchHistory = new HashSet<PlayerMatchHistory>();
        }

        public int PplayerId { get; set; }
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public int AvatarId { get; set; }
        public int MinutesPlayed { get; set; }
        public int HoursPlayed { get; set; }
        public int TotalLeaves { get; set; }
        public int ControllerTier { get; set; }
        public int KbmTier { get; set; }
        public int ConquestTier { get; set; }
        public int TotalWorshippers { get; set; }
        public int TotalXp{ get; set; }
        public int TotalWins{ get; set; }
        public DateTime LastLoginTimeStamp { get; set; }
        public DateTime AccountCreatedOnTimeStamp { get; set; }
        public int AccountLevel { get; set; }
        public string LoadingFrame { get; set; }
        public int MasteryLevel { get; set; }
        public string PersonalStatusMessage { get; set; }

        public virtual ICollection<PlayerRankDetails> PlayerRankDetails { get; set; }
        public virtual ICollection<PlayerChampionStats> PlayerChampionStats { get; set; }
        public virtual ICollection<Friend> Friends { get; set; }
        public virtual ICollection<PlayerMatchHistory> PlayerMatchHistory { get; set; }
    }
}
