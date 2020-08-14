using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IPlayerService
    {
        Task<Response<List<PlayerClientModel>>> GetPlayerAsync(PlayerBaseRequest request);
        Task<Response<List<PlayerFriendsClientModel>>> GetPlayerFriendsAsync(PlayerBaseRequest request);
        Task<Response<List<PlayerChampionRanksClientModel>>> GetPlayerChampionRanksAsync(PlayerBaseRequest request);
        Task<Response<List<MatchDetailsClientModel>>> GetPlayerMatchHistoryAsync(PlayerBaseRequest request);
        Task<Response<List<PlayerLoadoutsClientModel>>> GetPlayerLoadoutsAsync(PlayerLoadoutsRequest request);
        Task<Response<List<PlayerStatusClientModel>>> GetPlayerStatusAsync(PlayerBaseRequest request);
        Task<Response<List<PlayerQueueStatsClientModel>>> GetPlayerQueueStatsAsync(PlayerQueueStatsRequest request);
    }
}
