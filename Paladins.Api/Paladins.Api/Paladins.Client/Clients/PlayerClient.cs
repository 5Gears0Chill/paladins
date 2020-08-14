using Paladins.Common.ClientModels;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Requests;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class PlayerClient : BaseClient, IPlayerClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public PlayerClient(IRequestUrlBuilder requestUrlBuilder)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<PlayerClientModel>> GetClientPlayerAsync(PlayerBaseRequest request)
                => await SendRequestAsync<List<PlayerClientModel>>(_requestUrlBuilder.BuildGetPlayerUrl(request.SessionId, request.PlayerName));

        public async Task<List<PlayerFriendsClientModel>> GetClientPlayerFriendsAsync(PlayerBaseRequest request)
                => await SendRequestAsync<List<PlayerFriendsClientModel>>(_requestUrlBuilder.BuildGetFriendsUrl(request.SessionId, request.PlayerName));

        public async Task<List<PlayerChampionRanksClientModel>> GetClientChampionRanksAsync(PlayerBaseRequest request)
                => await SendRequestAsync<List<PlayerChampionRanksClientModel>>(_requestUrlBuilder.BuildGetChampionRanksUrl(request.SessionId, request.PlayerName));
        public async Task<List<MatchDetailsClientModel>> GetClientMatchHistoryAsync(PlayerBaseRequest request)
                => await SendRequestAsync<List<MatchDetailsClientModel>>(_requestUrlBuilder.BuildGetMatchHistoryUrl(request.SessionId, request.PlayerName));
        public async Task<List<PlayerLoadoutsClientModel>> GetClientPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
                => await SendRequestAsync<List<PlayerLoadoutsClientModel>>(_requestUrlBuilder.BuildGetPlayerLoadoutsUrl(request.SessionId, request.PlayerName, request.LanguageId));
        public async Task<List<PlayerStatusClientModel>> GetClientPlayerStatusAsync(PlayerBaseRequest request)
                => await SendRequestAsync<List<PlayerStatusClientModel>>(_requestUrlBuilder.BuildGetPlayerStatusUrl(request.SessionId, request.PlayerName));
        public async Task<List<PlayerQueueStatsClientModel>> GetClientPlayerQueueStatsAsync(PlayerQueueStatsRequest request)
                => await SendRequestAsync<List<PlayerQueueStatsClientModel>>(_requestUrlBuilder.BuildGetQueueStatsUrl(request.SessionId, request.PlayerName, request.QueueId));
    
    }
}
