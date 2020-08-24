using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using System.Collections.Generic;
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
        private readonly IQueueRepository _queueRepository;
        public SeedService(ILanguageRepository languageRepository, IQueueRepository queueRepository)
        {
            _languageRepository = languageRepository;
            _queueRepository = queueRepository;
        }

        public async Task<IEnumerable<NonDataResult>> SeedAsync()
        {
            //insert languages
            var langaugeResult =  await _languageRepository.InsertBaseLanguageOptionsAsync();
            //insert queues
            var queueResult = await _queueRepository.InsertBaseQueuesAsync();
            return new List<NonDataResult>() { langaugeResult, queueResult };
            
        }
    }
}
