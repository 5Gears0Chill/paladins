using Paladins.Common.DataAccess.Models;

namespace Paladins.Repository.Entities
{
    public partial class MatchBans : BaseEntity
    {
        public int MatchDetailsId { get; set; }
        public int PmatchId { get; set; }
        public int BanPosition { get; set; }
        public int PchampionId { get; set; }
        public string ChampionName { get; set; }
        public virtual MatchDetails MatchDetails { get; set; }
        public virtual Champion Pchampion { get; set; }
        public virtual MatchDetails Pmatch { get; set; }
    }
}
