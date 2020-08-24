using Microsoft.EntityFrameworkCore;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Languages;
using Paladins.Repository.PaladinsDbContext.Interfaces;
using Paladins.Repository.Repositories.Base;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class LanguageRepository : Repository<Language>, ILanguageRepository
    {
        private readonly ILanguageMapper _mapper;

        public LanguageRepository(IDbContext context, ILanguageMapper mapper)
            :base(context)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseLanguageOptionsAsync()
        {
            var languages = _mapper.MapEnumerable();
            return await InsertEnumerableAsync(languages);
        }

        public async Task<NonDataResult> ClearTableAsync()
        {
            var languages = await Entities.Select(l => l).ToListAsync();
            return await DeleteEnumerableAsync(languages);
        }
    }
}
