using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class MatchHistoryModel : IModel
    {    
        public int Id { get; set; }
        public int PaladinsChampionId { get; set; }
        public int PaladinsMatchId { get; set; }
        public string ChampionName { get; set; }
        public int Kills { get; set; }
        public int Deaths { get; set; }
        public int Assists { get; set; }
        public string MatchResult { get; set; }
    }
}
