using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class LoadoutSelected : BaseEntity
    {
        public int MatchDetailsId { get; set; }
        public int PmatchId { get; set; }
        public int PplayerId { get; set; }
        public int PitemId { get; set; }
        public int LoadoutItemLevel { get; set; }
        public string LoadoutItemName { get; set; }

        public virtual MatchDetails MatchDetails { get; set; }
    }
}
