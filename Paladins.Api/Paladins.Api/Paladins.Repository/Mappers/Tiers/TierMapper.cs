using Paladins.Repository.Entities;
using Paladins.Repository.SeedData.Data.Tier;
using Paladins.Repository.SeedData.Models.Tier;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Repository.Mappers.Tiers
{
    public class TierMapper : MapperBase<RootTier>, ITierMapper
    {
        public IEnumerable<Tier> MapEnumerable()
        {
            var from = LoadJson(TierData.CreateInstance());

            return from.Tiers.Select(l => new Tier
            {
                Name = l.Name,
                PtierId = l.Id
            });
        }
    }
}
