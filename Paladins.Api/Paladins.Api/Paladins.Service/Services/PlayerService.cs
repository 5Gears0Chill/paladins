using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class PlayerService: IPlayerService
    {
        private readonly IPlayerClient _playerClient;
        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly IMapper<PlayerClientModel, PlayerModel> _playerMapper;
        private readonly IStrategyResolver _strategyResolver;
        public PlayerService(
            IPlayerClient playerClient,
            IUnitOfWorkManager unitOfWorkManager,
            IMapper<PlayerClientModel, PlayerModel> playerMapper, 
            IStrategyResolver strategyResolver)
        {
            _playerClient = playerClient;
            _unitOfWorkManager = unitOfWorkManager;
            _playerMapper = playerMapper;
            _strategyResolver = strategyResolver;
        }

        public async Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request)
        {
            var strategy = _strategyResolver.Resolve<IBasePlayerStrategy>();
            return await strategy.GetPlayerAsync(request);
        } 

        public async Task<Response<PlayerModel>> GetPlayerFriendsAsync(PlayerBaseRequest request)
        {
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, PlayerFriendsClientModel, FriendModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientPlayerFriendsAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerChampionRanksAsync(PlayerBaseRequest request)
        {
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, PlayerChampionRanksClientModel, PlayerChampionStatsModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientChampionRanksAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request)
        {
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, MatchDetailsClientModel, PlayerMatchHistoryModel>>();
            var response =  await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientMatchHistoryAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
        {
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerLoadoutsRequest, PlayerLoadoutsClientModel, PlayerLoadoutModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientPlayerLoadoutsAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<List<PlayerStatusClientModel>>> GetPlayerStatusAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientPlayerStatusAsync(request);

            return new Response<List<PlayerStatusClientModel>>() { Data = response };
        }

        public async Task<Response<List<PlayerQueueStatsClientModel>>> GetPlayerQueueStatsAsync(PlayerQueueStatsRequest request)
        {
            var response = await _playerClient.GetClientPlayerQueueStatsAsync(request);

            return new Response<List<PlayerQueueStatsClientModel>>() { Data = response };
        }

        /// <summary>
        /// Method to store if not exists else return current
        /// </summary>
        /// <param name="playerData">Player client model</param>
        /// <returns></returns>
        private async Task<PlayerModel> StorePlayerDataAsync(PlayerClientModel playerData)
        {
            if (playerData.IsNull())
            {
                return null;
            }

            var model = _playerMapper.Map(playerData);
                
            var player = await _unitOfWorkManager
                .ExecuteSingleAsync<IPlayerRepository, PlayerModel>
                (u => u.GetPlayerByPaladinsPlayerId(model.PaladinsPlayerId));
            if(player.IsNull())
            {
                var response = await _unitOfWorkManager
                .ExecuteSingleAsync<IPlayerRepository, DataResult<PlayerModel>>
                (u => u.InsertNewPlayerAsync(model));
                if (response.IsSuccessful)
                {
                    return response.Data;
                }
            }
            else
            {
                model.PlayerId = player.PlayerId;
                model.LastUpdatedOn = player.LastUpdatedOn;
                model.CreatedOn = player.CreatedOn;
                model.IsActive = player.IsActive;
                var response = await _unitOfWorkManager
                    .ExecuteSingleAsync<IPlayerRepository, DataResult<PlayerModel>>
                    (u => u.UpdatePlayerAsync(model));
                if (response.IsSuccessful)
                {
                    return response.Data;
                }
            }
            return null;
        }
    }
}
