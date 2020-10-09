namespace Paladins.Common.Models
{
    public class MatchBansModel
    {
        public int PaladinsMatchId { get; set; }
        public int BanPosition { get; set; }
        public int PaladinsChampionId { get; set; }
        public string ChampionName { get; set; }
        public string ChampionIconUrl { get; set; }
    }
}
