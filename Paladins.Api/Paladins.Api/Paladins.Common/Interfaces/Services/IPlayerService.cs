using Paladins.Common.ClientModels.Player;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    /// <summary>
    /// PlayerService is a methodology created for constantly fetching the latest information from the Paladins API.
    /// Its goal is to ensure the mobile application receives the latest information when any player information is requested.
    /// It does not hold paging functionality.
    /// Called before the player paging service.
    /// </summary>
    public interface IPlayerService
    {
        /// <summary>
        /// Gets a player profile and updates db with latest information.
        /// </summary>
        /// <param name="request">Player request with player name</param>
        /// <returns>Player Model with no additional information</returns>
        Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request);

        /// <summary>
        /// Gets and updates friends associated with a partner
        /// </summary>
        /// <param name="request">Player request with player name</param>
        /// <returns>Player Model with friend information</returns>
        Task<Response<PlayerModel>> GetPlayerFriendsAsync(PlayerBaseRequest request);
        /// <summary>
        /// Gets and updates champion statistics associated with a partner
        /// </summary>
        /// <param name="request">Player request with player name</param>
        /// <returns>Player Model with champion stats information</returns>
        Task<Response<PlayerModel>> GetPlayerChampionRanksAsync(PlayerBaseRequest request);
        /// <summary>
        /// Gets and updates the players match history.
        /// </summary>
        /// <param name="request">Player request with player name</param>
        /// <returns>Player Model with match history information</returns>
        Task<Response<PlayerModel>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request);
        /// <summary>
        /// Gets and updates current player loadouts
        /// </summary>
        /// <param name="request">Player request with player name and a default language Id</param>
        /// <returns>Player Model with loadout information</returns>
        Task<Response<PlayerModel>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request);
        /// <summary>
        /// Currently requests player status 
        /// -> requires work.
        /// </summary>
        /// <param name="request">Player request with player name and a default language Id</param>
        /// <returns>status of a player</returns>
        Task<Response<List<PlayerStatusClientModel>>> GetPlayerStatusAsync(PlayerBaseRequest request);
        /// <summary>
        /// Currently requests player queue stats
        /// -> requires work.
        /// -> unused.
        /// </summary>
        /// <param name="request">requires queue information</param>
        /// <returns>status of a player queue stats</returns>
        Task<Response<List<PlayerQueueStatsClientModel>>> GetPlayerQueueStatsAsync(PlayerQueueStatsRequest request);
    }
}
