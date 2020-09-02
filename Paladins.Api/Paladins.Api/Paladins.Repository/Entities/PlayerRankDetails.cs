using Paladins.Common.DataAccess.Models;

namespace Paladins.Repository.Entities
{
    public partial class PlayerRankDetails : AuditBaseEntity
    {
        public int PlayerId { get; set; }
        public string RankName { get; set; }
        public int Leaves { get; set; }
        public int Losses { get; set; }
        public int Points { get; set; }
        public int PreviousRank { get; set; }
        public int Rank { get; set; }
        public int Season { get; set; }
        public int Tier { get; set; }
        public int Trend { get; set; }
        public int Wins { get; set; }

        public virtual Player Player { get; set; }
    }
}
