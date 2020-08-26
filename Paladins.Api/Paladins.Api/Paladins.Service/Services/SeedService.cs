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

        private readonly IUnitOfWorkManager _unitOfWorkManager;
        public SeedService(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;   
        }

        public async Task<IEnumerable<NonDataResult>> SeedAsync()
        {
            //insert languages
            var langaugeResult = await _unitOfWorkManager.ExecuteSingleAsync<ILanguageRepository, NonDataResult>(u => u.InsertBaseLanguageOptionsAsync());
            //insert queues
            var queueResult = await _unitOfWorkManager.ExecuteSingleAsync<IQueueRepository, NonDataResult>(u => u.InsertBaseQueuesAsync());
            //insert tiers
            var tierResult = await _unitOfWorkManager.ExecuteSingleAsync<ITierRepository, NonDataResult>(u => u.InsertBaseTiersAsync());
            return new List<NonDataResult>() { langaugeResult, queueResult, tierResult };
            
        }
    }
}
