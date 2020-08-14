using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class PlayerService: IPlayerService
    {
        private readonly IPlayerClient _playerClient;

        public PlayerService(IPlayerClient playerClient)
        {
            _playerClient = playerClient;
        }

        public async Task<Response<List<PlayerClientModel>>> GetPlayerAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientPlayerAsync(request);

            return new Response<List<PlayerClientModel>>() { Data = response};
        } 

        public async Task<Response<List<PlayerFriendsClientModel>>> GetPlayerFriendsAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientPlayerFriendsAsync(request);

            return new Response<List<PlayerFriendsClientModel>>() { Data = response };
        }

        public async Task<Response<List<PlayerChampionRanksClientModel>>> GetPlayerChampionRanksAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientChampionRanksAsync(request);

            return new Response<List<PlayerChampionRanksClientModel>>() { Data = response };
        }

        public async Task<Response<List<MatchDetailsClientModel>>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientMatchHistoryAsync(request);

            return new Response<List<MatchDetailsClientModel>>() { Data = response };
        }

        public async Task<Response<List<PlayerLoadoutsClientModel>>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
        {
            var response = await _playerClient.GetClientPlayerLoadoutsAsync(request);

            return new Response<List<PlayerLoadoutsClientModel>>() { Data = response };
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
    }
}
