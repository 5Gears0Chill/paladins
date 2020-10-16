using Paladins.Common.Interfaces.Definitions;
using System;

namespace Paladins.Common.Models
{
    public class PlayerMatchHistoryModel : IModel
    {
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public int PaladinsMatchId { get; set; }
        public int PaladinsChampionId { get; set; }
        public int Kills { get; set; }
        public int Deaths { get; set; }
        public int Assists { get; set; }
        public DateTime EntryDateTime { get; set; }
        public string MatchResult { get; set; }
    }
}
