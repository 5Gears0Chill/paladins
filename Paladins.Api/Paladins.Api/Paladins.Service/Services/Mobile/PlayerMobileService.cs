using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Threading.Tasks;

namespace Paladins.Service.Services.Mobile
{

    public class PlayerMobileService : IPlayerMobileService
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;
       
        public PlayerMobileService(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;
        }

        public async Task<PagedResponse<FriendModel>> GetPagedPlayerFriendsAsync(PlayerPagedRequest request)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
                <IFriendRepository, PagedResponse<FriendModel>>
                (u => u.GetPagedFriendsAsync(request));
        }

        public async Task<PagedResponse<MatchHistoryModel>> GetPagedPlayerMatchHistoryAsync(PlayerPagedRequest request)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
               <IMatchHistoryRepository, PagedResponse<MatchHistoryModel>>
               (u => u.GetPagedMatchHistoriesAsync(request));
        }

        public async Task<PagedResponse<PlayerLoadoutModel>> GetPagedPlayerLoadoutsAsync(PlayerPagedRequest request, PlayerModel model)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
              <ILoadoutRepository, PagedResponse<PlayerLoadoutModel>>
              (u => u.GetPagedLoadoutsAsync(request, model));
        }

        public async Task<PagedResponse<PlayerChampionStatsModel>> GetPagedPlayerChampionStatsAsync(PlayerPagedRequest request, PlayerModel model)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
             <IChampionRepository, PagedResponse<PlayerChampionStatsModel>>
             (u => u.GetPagedPlayerChampionStats(request, model));
        }
    }
}
