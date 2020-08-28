using System;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Common.Models
{
    public class ChampionModel
    {
        public ChampionModel()
        {
            Abilities = new List<AbilityModel>();
            ChampionLinkageModels = new List<ChampionLinkageModel>();
        }

        public int PaladinsChampionId { get; set; }
        public string LatestChampion { get; set; }
        public string Role { get; set; }
        public int Speed { get; set; }
        public string Title { get; set; }
        public string Name { get; set; }
        public string Lore { get; set; }
        public int Health { get; set; }
        public Uri ChampionIconUrl { get; set; }
        public IEnumerable<AbilityModel> Abilities { get; set; }

        public List<ChampionLinkageModel> ChampionLinkageModels { get; set; }
    }

    
}
