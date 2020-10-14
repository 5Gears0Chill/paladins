using PaladinsAdmin.Framework.Models.Pagination;
using System;

namespace PaladinsAdmin.Models.Player
{
    public class PlayerListModel : BasePagedListModel<PlayerListItemModel>
    {
        public int PaladinsPlayerId { get; set; }
        public string Name { get; set; }
        public int MinutesPlayed { get; set; }
        public int HoursPlayed { get; set; }
        public int TotalLeaves { get; set; }
        public int TotalWins { get; set; }
        public DateTime LastLoginTimeStamp { get; set; }
        public DateTime AccountCreatedOnTimeStamp { get; set; }
        public int AccountLevel { get; set; }
    }
}
