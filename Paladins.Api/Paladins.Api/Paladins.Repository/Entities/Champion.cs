using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Champion : AuditBaseEntity
    {
        public Champion()
        {
            ChampionAbilities = new HashSet<ChampionAbilities>();
            ChampionSkins = new HashSet<ChampionSkins>();
            MatchBans = new HashSet<MatchBans>();
            PlayerChampionStats = new HashSet<PlayerChampionStats>();
            Skin = new HashSet<Skin>();
        }

        public int PchampionId { get; set; }
        public string Role { get; set; }
        public string Title { get; set; }
        public string Lore { get; set; }
        public int Health { get; set; }
        public int Speed { get; set; }
        public string IsLatestChampion { get; set; }

        public virtual ICollection<ChampionAbilities> ChampionAbilities { get; set; }
        public virtual ICollection<ChampionSkins> ChampionSkins { get; set; }
        public virtual ICollection<MatchBans> MatchBans { get; set; }
        public virtual ICollection<PlayerChampionStats> PlayerChampionStats { get; set; }
        public virtual ICollection<Skin> Skin { get; set; }
    }
}
