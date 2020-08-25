using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.DataAccess;
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

        private readonly IUnitOfWorkManager _languageUnitOfWorkManager;
        private readonly IUnitOfWorkManager _queueUnitOfWorkManager;
        public SeedService(IUnitOfWorkManager languageUnitOfWorkManager, IUnitOfWorkManager queueUnitOfWorkManager)
        {
            _languageUnitOfWorkManager = languageUnitOfWorkManager;
            _queueUnitOfWorkManager = queueUnitOfWorkManager;
        }

        public async Task<IEnumerable<NonDataResult>> SeedAsync()
        {
            //insert languages
            var langaugeResult = await _languageUnitOfWorkManager.ExecuteSingleAsync<ILanguageRepository, NonDataResult>(u => u.InsertBaseLanguageOptionsAsync());
            //insert queues
            var queueResult = await _queueUnitOfWorkManager.ExecuteSingleAsync<IQueueRepository, NonDataResult>(u => u.InsertBaseQueuesAsync());
            return new List<NonDataResult>() { langaugeResult, queueResult };
            
        }
    }
}
