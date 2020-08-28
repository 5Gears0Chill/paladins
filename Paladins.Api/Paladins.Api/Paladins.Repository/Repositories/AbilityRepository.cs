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
    public class AbilityRepository: Repository<PaladinsDbContext>, IAbilityRepository
    {
        private readonly IMapper<AbilityModel, Ability> _mapper;
        public AbilityRepository(IAuditManager auditManager, IMapper<AbilityModel, Ability> mapper)
            :base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertAbilitiesAsync(IEnumerable<AbilityModel> abilities)
        {
            var filtered = abilities
              .DistinctBy(ability => ability.PaladinsAbilityId)
              .Select(x => _mapper.Map(x));
            return await InsertListAsync(filtered);
        }
    }
}
