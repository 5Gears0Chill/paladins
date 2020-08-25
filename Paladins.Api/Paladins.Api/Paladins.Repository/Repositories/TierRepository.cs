using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Tiers;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class TierRepository : Repository<PaladinsDbContext>, ITierRepository
    {
        private readonly ITierMapper _mapper;
        public TierRepository(ITierMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseTiersAsync()
        {
            var tiers = _mapper.MapEnumerable();
            return await InsertListAsync(tiers);
        }
    }
}
