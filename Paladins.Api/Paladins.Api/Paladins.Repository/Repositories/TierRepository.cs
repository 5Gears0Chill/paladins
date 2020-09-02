using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Mappers.Tiers;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class TierRepository : Repository<PaladinsDbContext>, ITierRepository
    {
        private readonly ITierMapper _mapper;
        public TierRepository(ITierMapper mapper, IAuditManager auditManager)
            : base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseTiersAsync()
        {
            var tiers = _mapper.MapEnumerable();
            return await InsertListAsync(tiers);
        }

        public async Task<NonDataResult> UpdateBaseTiersAsync()
        {
            var tiers = _mapper.MapEnumerable();
            var currentTiers = await Context.Tier.Select(x => x).ToListAsync();
            var enumerator = tiers.GetEnumerator();
            var currentEnumerator = currentTiers.GetEnumerator();
            while (enumerator.MoveNext())
            {
                currentEnumerator.MoveNext();
                enumerator.Current.Id = currentEnumerator.Current.Id;
            }
            return await UpdateListAsync(tiers);
        }
    }
}
