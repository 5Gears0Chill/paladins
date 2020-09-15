using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Interfaces.SessionManager;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class PlayerService: IPlayerService
    {
        private readonly IPlayerClient _playerClient;
        private readonly IStrategyResolver _strategyResolver;
        private readonly ISessionManager _sessionManager;
        public PlayerService(
            IPlayerClient playerClient,
            ISessionManager sessionManager,
            IStrategyResolver strategyResolver)
        {
            _playerClient = playerClient;
            _sessionManager = sessionManager;
            _strategyResolver = strategyResolver;
        }

        public async Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var strategy = _strategyResolver.Resolve<IBasePlayerStrategy>();
            return await strategy.GetPlayerAsync(request);
        } 

        public async Task<Response<PlayerModel>> GetPlayerFriendsAsync(PlayerBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, PlayerFriendsClientModel, FriendModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientPlayerFriendsAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerChampionRanksAsync(PlayerBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, PlayerChampionRanksClientModel, PlayerChampionStatsModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientChampionRanksAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerBaseRequest, MatchDetailsClientModel, PlayerMatchHistoryModel>>();
            var response =  await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientMatchHistoryAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<PlayerModel>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var strategy = _strategyResolver.Resolve<IPlayerStrategy<PlayerLoadoutsRequest, PlayerLoadoutsClientModel, PlayerLoadoutModel>>();
            var response = await strategy.Get(request);
            strategy.Populate(await _playerClient.GetClientPlayerLoadoutsAsync(request));
            return await strategy.Process(response, await strategy.Find());
        }

        public async Task<Response<List<PlayerStatusClientModel>>> GetPlayerStatusAsync(PlayerBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var response = await _playerClient.GetClientPlayerStatusAsync(request);

            return new Response<List<PlayerStatusClientModel>>() { Data = response };
        }

        public async Task<Response<List<PlayerQueueStatsClientModel>>> GetPlayerQueueStatsAsync(PlayerQueueStatsRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var response = await _playerClient.GetClientPlayerQueueStatsAsync(request);

            return new Response<List<PlayerQueueStatsClientModel>>() { Data = response };
        }

    }
}
