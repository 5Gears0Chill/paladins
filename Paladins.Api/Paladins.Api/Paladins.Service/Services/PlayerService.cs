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

        public async Task<Response<PlayerModel>> GetPlayerFriendsAsync(PlayerBaseRequest request)
        {
            var response = new Response<PlayerModel>();
            var player = await _unitOfWorkManager
                .ExecuteSingleAsync<IPlayerRepository, PlayerModel>(u => u.GetPlayerByPlayerName(request.PlayerName));
            if (player.IsNull())
            {
                var storedResult = await GetPlayerAsync(request);
                player = storedResult.Data;
            }
            response.Data = player;
            var clientResponse = await _playerClient.GetClientPlayerFriendsAsync(request);
            player.PopulateFriends(clientResponse);

            var friends = await _unitOfWorkManager.ExecuteSingleAsync<IFriendRepository, IEnumerable<FriendModel>>(u => u.GetFriendsAsync(player));
            if (friends.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync<IFriendRepository, DataListResult<FriendModel>>(u => u.UpdateFriendsAsync(friends.ToList(), player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.Friends = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update friends");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync<IFriendRepository, DataListResult<FriendModel>>(u => u.InsertFriendsAsync(player.Friends, player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.Friends = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert friends");
                }
            }

           
         
            
            return response;
        }

        public async Task<Response<PlayerModel>> GetPlayerChampionRanksAsync(PlayerBaseRequest request)
        {
            var response = new Response<PlayerModel>();
            var player = await _unitOfWorkManager
              .ExecuteSingleAsync<IPlayerRepository, PlayerModel>(u => u.GetPlayerByPlayerName(request.PlayerName));
            if (player.IsNull())
            {
                var storedResult = await GetPlayerAsync(request);
                player = storedResult.Data;
            }
            response.Data = player;
            var clientResponse = await _playerClient.GetClientChampionRanksAsync(request);
            player.PopulateChampionStats(clientResponse);
            var championStats = await _unitOfWorkManager.ExecuteSingleAsync<IChampionRepository, IEnumerable<PlayerChampionStatsModel>>(u => u.GetPlayerChampionStatsAsync(player));
            if (championStats.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <IChampionRepository, DataListResult<PlayerChampionStatsModel>>
                    (u => u.UpdatePlayerChampionStatsAsync(championStats.ToList(), player));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.ChampionStats = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update Champion Stats");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <IChampionRepository, DataListResult<PlayerChampionStatsModel>>
                    (u => u.InsertPlayerChampionStatsAsync(player.ChampionStats,player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.ChampionStats = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert Champion Stats");
                }
            }


            return response;
        }

        public async Task<Response<PlayerModel>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request)
        {
            var response = new Response<PlayerModel>();
            var player = await _unitOfWorkManager
             .ExecuteSingleAsync<IPlayerRepository, PlayerModel>(u => u.GetPlayerByPlayerName(request.PlayerName));
            if (player.IsNull())
            {
                var storedResult = await GetPlayerAsync(request);
                player = storedResult.Data;
            }
            response.Data = player;
            var clientResponse = await _playerClient.GetClientMatchHistoryAsync(request);
            player.PopulateMatchHistory(clientResponse);

            var matchHistories = await _unitOfWorkManager.ExecuteSingleAsync<IMatchHistoryRepository, IEnumerable<PlayerMatchHistoryModel>>
                (u => u.GetPlayerMatchHistories(player));

            if (matchHistories.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                   <IMatchHistoryRepository, DataListResult<PlayerMatchHistoryModel>>
                   (u => u.UpdatePlayerMatchHistoryAsync(matchHistories.ToList(), player));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.MatchHistories = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update Match Histories");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                   <IMatchHistoryRepository, DataListResult<PlayerMatchHistoryModel>>
                   (u => u.InsertPlayerMatchHistoryAsync(player.MatchHistories, player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.MatchHistories = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert Champion Stats");
                }
            }

            return response;
        }

        public async Task<Response<PlayerModel>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
        {
            var response = new Response<PlayerModel>();

         

            var player = await _unitOfWorkManager
            .ExecuteSingleAsync<IPlayerRepository, PlayerModel>(u => u.GetPlayerByPlayerName(request.PlayerName));
            if (player.IsNull())
            {
                var storedResult = await GetPlayerAsync(request);
                player = storedResult.Data;
            }
            response.Data = player;
            var clientResponse = await _playerClient.GetClientPlayerLoadoutsAsync(request);
            player.PopulateLoadouts(clientResponse);
            var loadouts = await _unitOfWorkManager.ExecuteSingleAsync
                <ILoadoutRepository, IEnumerable<PlayerLoadoutModel>>
                (u => u.GetPlayerLoadoutAsync(player));

            if (loadouts.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <ILoadoutRepository, DataListResult<PlayerLoadoutModel>>
                    (u => u.UpdatePlayerLoadoutAsync(loadouts.ToList()));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.Loadouts = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update Loadouts");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <ILoadoutRepository, DataListResult<PlayerLoadoutModel>>
                    (u => u.InsertPlayerLoadoutAsync(player.Loadouts));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.Loadouts = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert Loadouts");
                }
            }
            return response;
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
