using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Player : BaseEntity
    {
        public Player()
        {
            PlayerChampionStats = new HashSet<PlayerChampionStats>();
            PlayerFriends = new HashSet<PlayerFriends>();
            PlayerMatchHistory = new HashSet<PlayerMatchHistory>();
        }

        public int PplayerId { get; set; }
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public int AvatarId { get; set; }
        public int MinutesPlayed { get; set; }
        public int HoursPlayed { get; set; }
        public string LastLoginTimeStamp { get; set; }
        public int Leaves { get; set; }
        public int AccountLevel { get; set; }
        public string LoadingFrame { get; set; }
        public string MasteryLevel { get; set; }
        public string PersonalStatusMessage { get; set; }

        public virtual ICollection<PlayerChampionStats> PlayerChampionStats { get; set; }
        public virtual ICollection<PlayerFriends> PlayerFriends { get; set; }
        public virtual ICollection<PlayerMatchHistory> PlayerMatchHistory { get; set; }
    }
}
