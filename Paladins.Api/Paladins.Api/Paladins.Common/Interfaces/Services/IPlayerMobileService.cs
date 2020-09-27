using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    /// <summary>
    /// PlayerMobileService creates a way the mobile app can fetch paged player data. 
    /// It differs from PlayerService by providing paging functionality for the mobile application.
    /// </summary>
    public interface IPlayerMobileService
    {
        /// <summary>
        /// Created as a paging methodology for the mobile app.
        /// This service method fetches a paged list of a players friend. 
        /// It is created to improve loading performance of the mobile application instead of persisting a large load.
        /// </summary>
        /// <param name="request">Paged Request with player name</param>
        /// <returns>Paged response of friends</returns>
        Task<PagedResponse<FriendModel>> GetPagedPlayerFriendsAsync(PlayerPagedRequest request);
        /// <summary>
        /// Created as a paging methodology for the mobile app.
        /// This service method fetches a paged list of a players match history.
        /// This extends the players ability to see all history from instanciation of the app.
        /// It is created to improve loading performance of the mobile application instead of persisting a large load.
        /// </summary>
        /// <param name="request">Paged Request with player name</param>
        /// <returns>Paged Response of match histories</returns>
        Task<PagedResponse<MatchHistoryModel>> GetPagedPlayerMatchHistoryAsync(PlayerPagedRequest request);
        /// <summary>
        /// Created as a paging methodology for the mobile app.
        /// This service method fetches a paged list of a players champion loadouts. 
        /// It is created to improve loading performance of the mobile application instead of persisting a large load.
        /// </summary>
        /// <param name="request">Paged Request with player name</param>
        /// <param name="model">model with player information</param>
        /// <returns>Paged Response of loadouts</returns>
        Task<PagedResponse<PlayerLoadoutModel>> GetPagedPlayerLoadoutsAsync(PlayerPagedRequest request, PlayerModel model);
        /// <summary>
        /// Created as a paging methodology for the mobile app.
        /// This service method fetches a paged list of a players champion loadouts. 
        /// It is created to improve loading performance of the mobile application instead of persisting a large load.
        /// </summary>
        /// <param name="request">Paged Request with player name</param>
        /// <param name="model">model with player information</param>
        /// <returns>Paged Response of player champion stats</returns>
        Task<PagedResponse<PlayerChampionStatsModel>> GetPagedPlayerChampionStatsAsync(PlayerPagedRequest request, PlayerModel model);
    }
}
