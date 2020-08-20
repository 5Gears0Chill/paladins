using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class ItemsBought : BaseEntity
    {
        public int MatchDetailsId { get; set; }
        public int PitemId { get; set; }
        public string ItemName { get; set; }
        public int ItemLevel { get; set; }
        public int ItemOrder { get; set; }

        public virtual MatchDetails MatchDetails { get; set; }
    }
}
