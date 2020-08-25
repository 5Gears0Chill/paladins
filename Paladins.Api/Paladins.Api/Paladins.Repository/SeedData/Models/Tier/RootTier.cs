using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.SeedData.Models.Tier
{
    public class RootTier : IRootBase
    {
        public List<TierSeedData> Tiers { get; set; }
    }
}
