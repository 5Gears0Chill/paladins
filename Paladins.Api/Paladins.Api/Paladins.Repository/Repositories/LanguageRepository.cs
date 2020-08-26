using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Mappers.Languages;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class LanguageRepository : Repository<PaladinsDbContext>, ILanguageRepository
    {
        private readonly ILanguageMapper _mapper;

        public LanguageRepository(ILanguageMapper mapper, IAuditManager auditManager)
            :base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseLanguageOptionsAsync()
        {
            var languages = _mapper.MapEnumerable();
            return await InsertListAsync(languages);
        }

        public async Task<NonDataResult> ClearTableAsync()
        {
            var languages = await Context.Language
                .AsNoTracking()
                .Select(l => l)
                .ToListAsync();
            return await DeleteListAsync(languages);
        }
    }
}
