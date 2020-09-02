using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class PlayerService: IPlayerService
    {
        private readonly IPlayerClient _playerClient;
        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly ISessionClient _sessionClient;
        private readonly IMapper<PlayerClientModel, PlayerModel> _playerMapper;
        public PlayerService(
            IPlayerClient playerClient, 
            IUnitOfWorkManager unitOfWorkManager,
            ISessionClient sessionClient,
            IMapper<PlayerClientModel, PlayerModel> playerMapper
            )
        {
            _playerClient = playerClient;
            _unitOfWorkManager = unitOfWorkManager;
            _sessionClient = sessionClient;
            _playerMapper = playerMapper;
        }

        public async Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientPlayerAsync(request);
            var player = await StorePlayerDataAsync(response.FirstOrDefault());
            return new Response<PlayerModel>() { Data = player};
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

        /// <summary>
        /// Method to store if not exists else return current
        /// </summary>
        /// <param name="playerData"></param>
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
