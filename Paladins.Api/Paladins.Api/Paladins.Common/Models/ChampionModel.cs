﻿using Newtonsoft.Json;
using Paladins.Common.Interfaces.Definitions;
using System;
using System.Collections.Generic;

namespace Paladins.Common.Models
{
    public class ChampionModel : IModel
    {
        public ChampionModel()
        {
            Abilities = new List<AbilityModel>();
            ChampionLinkageModels = new List<ChampionLinkageModel>();
        }
        public int Id { get; set; }
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

        [JsonIgnoreAttribute]
        public List<ChampionLinkageModel> ChampionLinkageModels { get; set; }
    }

    
}
