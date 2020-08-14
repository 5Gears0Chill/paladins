using Paladins.Common.ClientModels;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Requests;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Clients
{
    public interface IPlayerClient
    {
        Task<List<PlayerClientModel>> GetClientPlayerAsync(PlayerBaseRequest request);
        Task<List<PlayerFriendsClientModel>> GetClientPlayerFriendsAsync(PlayerBaseRequest request);
        Task<List<PlayerChampionRanksClientModel>> GetClientChampionRanksAsync(PlayerBaseRequest request);
        Task<List<MatchDetailsClientModel>> GetClientMatchHistoryAsync(PlayerBaseRequest request);
        Task<List<PlayerLoadoutsClientModel>> GetClientPlayerLoadoutsAsync(PlayerLoadoutsRequest request);
        Task<List<PlayerStatusClientModel>> GetClientPlayerStatusAsync(PlayerBaseRequest request);
        Task<List<PlayerQueueStatsClientModel>> GetClientPlayerQueueStatsAsync(PlayerQueueStatsRequest request);
    }
}
