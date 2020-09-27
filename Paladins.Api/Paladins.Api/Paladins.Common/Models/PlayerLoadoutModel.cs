using System;
using System.Collections.Generic;

namespace Paladins.Common.Models
{
    public class PlayerLoadoutModel
    {
        public int Id { get; set; }
        public int PaladinsChampionId { get; set; }
        public string ChampionName { get; set; }
        public string ChampionUrl { get; set; }
        public string LoadoutName { get; set; }
        public int PaladinsLoadoutId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public string PlayerName { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastUpdatedOn { get; set; }
        public List<PlayerLoadoutItemModel> LoadoutItems { get; set; }
      
    }
}
