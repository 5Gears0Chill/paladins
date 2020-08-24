using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Skin : BaseEntity
    {
        public Skin()
        {
            ChampionSkins = new HashSet<ChampionSkins>();
        }

        public int PchampionId { get; set; }
        public string Rarity { get; set; }
        public int PskinId { get; set; }
        public string Name { get; set; }

        public virtual Champion Pchampion { get; set; }
        public virtual ICollection<ChampionSkins> ChampionSkins { get; set; }
    }
}
