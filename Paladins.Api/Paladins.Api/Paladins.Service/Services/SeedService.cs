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
    ///     -> Champion [Done]
    ///     -> Champion Abilities [Done]
    ///     -> Ability [Done]
    ///     -> Skins 
    /// </summary>
    public class SeedService : ISeedService
    {

        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly ISessionClient _sessionClient;
        private readonly IGeneralClient _generalClient;
        private readonly IMapper<GeneralItemsClientModel, ItemModel> _itemMapper;
        private readonly IMapper<GeneralChampionsClientModel, ChampionModel> _championMapper;
        private readonly IMapper<GeneralChampionsSkinsClientModel, SkinModel[]> _skinMapper;
        public SeedService(
            IUnitOfWorkManager unitOfWorkManager,
            ISessionClient sessionClient,
            IGeneralClient generalClient,
            IMapper<GeneralItemsClientModel, ItemModel> itemMapper,
            IMapper<GeneralChampionsClientModel, ChampionModel> championMapper,
            IMapper<GeneralChampionsSkinsClientModel, SkinModel[]> skinMapper
            )
        {
            _unitOfWorkManager = unitOfWorkManager;
            _sessionClient = sessionClient;
            _generalClient = generalClient;
            _itemMapper = itemMapper;
            _championMapper = championMapper;
            _skinMapper = skinMapper;
        }

        /// <summary>
        /// Initial Seeding of the database for the following tables:
        ///     -> Language
        ///     -> Queue
        ///     -> Tier
        ///     -> Item
        ///     -> Champion
        ///     -> Champion Abilities
        ///     -> Ability
        ///     -> Skins 
        /// </summary>
        /// <returns>List of NonDataResult</returns>
        public async Task<IEnumerable<NonDataResult>> SeedAsync()
        {
            var response = new List<NonDataResult>();
            //insert languages
            var langaugeResult = await _unitOfWorkManager.ExecuteSingleAsync<ILanguageRepository, NonDataResult>(u => u.InsertBaseLanguageOptionsAsync());
            response.Add(langaugeResult);
            //insert queues
            var queueResult = await _unitOfWorkManager.ExecuteSingleAsync<IQueueRepository, NonDataResult>(u => u.InsertBaseQueuesAsync());
            response.Add(queueResult);
            //insert tiers
            var tierResult = await _unitOfWorkManager.ExecuteSingleAsync<ITierRepository, NonDataResult>(u => u.InsertBaseTiersAsync());
            response.Add(tierResult);
            //generate session
            var session = await _sessionClient.GetClientSessionAsync();
            //fetch items using session
            var items = await _generalClient.GetClientItemsAsync(GeneralBaseRequest.CreateInstance(session.SessionId));
            //insert items
            var itemResult = await _unitOfWorkManager.ExecuteSingleAsync<IItemRepository, NonDataResult>
                (u => u.InsertItemsAsync(items.Select(x => _itemMapper.Map(x))));
            //fetch champions using session
            var champions = await _generalClient.GetClientChampionsAsync(GeneralBaseRequest.CreateInstance(session.SessionId));
            var mappedChampions = champions.Select(x => _championMapper.Map(x));
            //use champions to get all abilities
            var abilities = mappedChampions.SelectMany(x => x.Abilities);
            //insert abilities
            var abilityResult = await _unitOfWorkManager.ExecuteSingleAsync<IAbilityRepository, NonDataResult>
               (u => u.InsertAbilitiesAsync(abilities));
            response.Add(abilityResult);
            //insert champions
            var championResult = await _unitOfWorkManager.ExecuteSingleAsync<IChampionRepository, NonDataResult>
                (u => u.InsertChampionsAsync(mappedChampions));
            response.Add(championResult);
            //insert champion abilities
            var championAbilitiesResult = await _unitOfWorkManager.ExecuteSingleAsync<IChampionAbilitiesRepository, NonDataResult>(u => u.InsertLinkingRelationships(mappedChampions));
            response.Add(championAbilitiesResult);
            foreach (var champion in mappedChampions)
            {
                //foreach champion fetch champion skins
                var skins = await _generalClient.GetClientChampionSkinsAsync(ChampionSkinsRequest.CreateInstance(session.SessionId, champion.PaladinsChampionId));
                var mappedSkins = skins.Select(x => _skinMapper.Map(x)).SelectMany(x => x.ToList());
                //insert skin
                var skinResult = await _unitOfWorkManager.ExecuteSingleAsync<ISkinRepository, NonDataResult>(u => u.InsertBaseChampionSkins(mappedSkins));
                response.Add(skinResult);
            }
            return response;      
        }
    }
}
