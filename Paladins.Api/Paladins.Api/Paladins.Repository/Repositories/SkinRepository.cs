using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class SkinRepository : Repository<PaladinsDbContext>, ISkinRepository
    {
        private readonly IMapper<SkinModel, Skin> _mapper;
        public SkinRepository(IAuditManager auditManager, IMapper<SkinModel, Skin> mapper)
            :base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseChampionSkins(IEnumerable<SkinModel> skins)
        {
            var filtered = skins
             .DistinctBy(skin => skin.PaladinsSkinId)
             .Select(x => _mapper.Map(x));
            return await InsertListAsync(filtered);
        }
    }
}
