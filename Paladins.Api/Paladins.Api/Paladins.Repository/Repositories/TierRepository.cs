using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Tiers;
using Paladins.Repository.PaladinsDbContext.Interfaces;
using Paladins.Repository.Repositories.Base;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class TierRepository : Repository<Tier>, ITierRepository
    {
        private readonly ITierMapper _mapper;
        public TierRepository(IDbContext context, ITierMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseTiersAsync()
        {
            var tiers = _mapper.MapEnumerable();
            return await InsertEnumerableAsync(tiers);
        }
    }
}
