using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    /// <summary>
    /// Seeds the following tables in the database:
    ///     -> Language
    ///     -> Queue
    ///     -> Tier
    ///     -> Item
    ///     -> Champion
    ///     -> Champion Skins
    ///     -> Skins
    /// </summary>
    public class SeedService : ISeedService
    {
        private readonly ILanguageRepository _languageRepository;
        public SeedService(ILanguageRepository languageRepository)
        {
            _languageRepository = languageRepository;
        }

        public async Task<NonDataResult> SeedAsync()
        {
            //insert languages
            return await _languageRepository.InsertBaseLanguageOptionsAsync();
        }
    }
}
