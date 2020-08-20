using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Ability : BaseEntity
    {
        public Ability()
        {
            ChampionAbilities = new HashSet<ChampionAbilities>();
        }

        public int PabilityId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }

        public virtual ICollection<ChampionAbilities> ChampionAbilities { get; set; }
    }
}
