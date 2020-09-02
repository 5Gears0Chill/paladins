using System;
using System.Collections.Generic;

namespace Paladins.Common.Models
{
    public class PlayerModel
    {
        public int PlayerId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public string Name { get; set; }
        public Uri AvatarUrl { get; set; }
        public int AvatarId { get; set; }
        public int MinutesPlayed { get; set; }
        public int HoursPlayed { get; set; }
        public int TotalLeaves { get; set; }
        public int ControllerTier { get; set; }
        public int KbmTier { get; set; }
        public int ConquestTier { get; set; }
        public int TotalWorshippers { get; set; }
        public int TotalXp { get; set; }
        public int TotalWins { get; set; }
        public DateTime LastLoginTimeStamp { get; set; }
        public DateTime AccountCreatedOnTimeStamp { get; set; }
        public int AccountLevel { get; set; }
        public string LoadingFrame { get; set; }
        public int MasteryLevel { get; set; }
        public string PersonalStatusMessage { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastUpdatedOn { get; set; }
        public bool IsActive { get; set; }
        public List<RankDetailsModel> RankDetailsModel { get; set; }
    }
}
