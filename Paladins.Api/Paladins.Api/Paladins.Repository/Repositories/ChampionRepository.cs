using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class ChampionRepository: Repository<PaladinsDbContext>, IChampionRepository
    {
        private readonly IMapper<ChampionModel, Champion> _mapper;
        public ChampionRepository(IAuditManager auditManager, IMapper<ChampionModel, Champion> mapper)
            :base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertChampionsAsync(IEnumerable<ChampionModel> champions)
        {
            var filtered = champions
               .DistinctBy(champion => champion.PaladinsChampionId)
               .Select(x => _mapper.Map(x));
            return await InsertListAsync(filtered);
        }
    }
}
