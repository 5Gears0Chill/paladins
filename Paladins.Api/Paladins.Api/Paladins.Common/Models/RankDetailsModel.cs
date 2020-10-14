using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class RankDetailsModel : IModel
    {
        public string RankedName { get; set; }
        public int Leaves { get; set; }
        public int Losses { get; set; }
        public int Points { get; set; }
        public int PreviousRank { get; set; }
        public int Rank { get; set; }
        public int Season { get; set; }
        public int Tier { get; set; }
        public int Trend { get; set; }
        public int Wins { get; set; }
    }
}
