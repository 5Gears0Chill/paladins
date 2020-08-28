using Paladins.Common.ClientModels.General;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    /// <summary>
    /// Seeds the following tables in the database:
    ///     -> Language [Done]
    ///     -> Queue [Done]
    ///     -> Tier [Done]
    ///     -> Item [Done]
    ///     -> Champion
    ///     -> Champion Skins
    ///     -> Skins
    /// </summary>
    public class SeedService : ISeedService
    {

        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly ISessionClient _sessionClient;
        private readonly IGeneralClient _generalClient;
        private readonly IMapper<GeneralItemsClientModel, ItemModel> _itemMapper;
        private readonly IMapper<GeneralChampionsClientModel, ChampionModel> _championMapper;
        public SeedService(
            IUnitOfWorkManager unitOfWorkManager,
            ISessionClient sessionClient,
            IGeneralClient generalClient,
            IMapper<GeneralItemsClientModel, ItemModel> itemMapper,
            IMapper<GeneralChampionsClientModel, ChampionModel> championMapper
            )
        {
            _unitOfWorkManager = unitOfWorkManager;
            _sessionClient = sessionClient;
            _generalClient = generalClient;
            _itemMapper = itemMapper;
            _championMapper = championMapper;
        }

        public async Task<IEnumerable<NonDataResult>> SeedAsync()
        {
            //insert languages
            var langaugeResult = await _unitOfWorkManager.ExecuteSingleAsync<ILanguageRepository, NonDataResult>(u => u.InsertBaseLanguageOptionsAsync());
            //insert queues
            var queueResult = await _unitOfWorkManager.ExecuteSingleAsync<IQueueRepository, NonDataResult>(u => u.InsertBaseQueuesAsync());
            //insert tiers
            var tierResult = await _unitOfWorkManager.ExecuteSingleAsync<ITierRepository, NonDataResult>(u => u.InsertBaseTiersAsync());

            var session = await _sessionClient.GetClientSessionAsync();
            var items = await _generalClient.GetClientItemsAsync(GeneralBaseRequest.CreateInstance(session.SessionId));
            var itemResult = await _unitOfWorkManager.ExecuteSingleAsync<IItemRepository, NonDataResult>
                (u => u.InsertItemsAsync(items.Select(x => _itemMapper.Map(x))));

            var champions = await _generalClient.GetClientChampionsAsync(GeneralBaseRequest.CreateInstance(session.SessionId));
            var mappedChampions = champions.Select(x => _championMapper.Map(x));
            var abilities = mappedChampions.SelectMany(x => x.Abilities);
            var abilityResult = await _unitOfWorkManager.ExecuteSingleAsync<IAbilityRepository, NonDataResult>
               (u => u.InsertAbilitiesAsync(abilities));
            var championResult = await _unitOfWorkManager.ExecuteSingleAsync<IChampionRepository, NonDataResult>
                (u => u.InsertChampionsAsync(mappedChampions));

            var championAbilitiesResult = await _unitOfWorkManager.ExecuteSingleAsync<IChampionAbilitiesRepository, NonDataResult>(u => u.InsertLinkingRelationships(mappedChampions));
           
            return new List<NonDataResult>() { langaugeResult, queueResult, tierResult, itemResult, abilityResult, championResult, championAbilitiesResult };
            
        }
    }
}
