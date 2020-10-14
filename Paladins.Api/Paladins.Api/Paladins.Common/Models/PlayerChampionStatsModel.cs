using Paladins.Common.Interfaces.Definitions;
using System;

namespace Paladins.Common.Models
{
    public class PlayerChampionStatsModel : IModel
    {
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public int PaladinsChampionId { get; set; }
        public string ChampionName { get; set; }
        public string ChampionUrl { get; set; }
        public int Assists { get; set; }
        public int Deaths { get; set; }
        public int Kills { get; set; }
        public int Rank { get; set; }
        public int Wins { get; set; }
        public int Losses { get; set; }
        public DateTime LastUpdatedOn { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
