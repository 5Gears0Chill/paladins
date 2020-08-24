using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Tier : BaseEntity
    {
        public Tier()
        {
            MatchDetails = new HashSet<MatchDetails>();
        }

        public int PtierId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<MatchDetails> MatchDetails { get; set; }
    }
}
