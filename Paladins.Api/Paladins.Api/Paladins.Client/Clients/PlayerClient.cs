using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Handlers;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class PlayerClient : BaseClient, IPlayerClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public PlayerClient(IRequestUrlBuilder requestUrlBuilder, IClientRetMessageHandler clientRetMessageHandler, IUnitOfWorkManager unitOfWorkManager)
            : base(clientRetMessageHandler, unitOfWorkManager)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<PlayerClientModel>> GetClientPlayerAsync(PlayerBaseRequest request)
        {  
            var response =  await SendRequestAsync<List<PlayerClientModel>>
                (_requestUrlBuilder.BuildGetPlayerUrl(request.SessionId, request.PlayerName));
            await LogUsageStat(ActionNameConstants.GetPlayer);
            return HandleRetMessageReponse(response);
        }

        public async Task<List<PlayerFriendsClientModel>> GetClientPlayerFriendsAsync(PlayerBaseRequest request)
        {
            var response = await SendRequestAsync<List<PlayerFriendsClientModel>>
            (_requestUrlBuilder.BuildGetFriendsUrl(request.SessionId, request.PlayerName));
            await LogUsageStat(ActionNameConstants.GetPlayerFriends);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<PlayerChampionRanksClientModel>> GetClientChampionRanksAsync(PlayerBaseRequest request)
        {
            var response = await SendRequestAsync<List<PlayerChampionRanksClientModel>>
                (_requestUrlBuilder.BuildGetChampionRanksUrl(request.SessionId, request.PlayerName));
            await LogUsageStat(ActionNameConstants.GetPlayerChampionRanks);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<MatchDetailsClientModel>> GetClientMatchHistoryAsync(PlayerBaseRequest request)
        {
            var response = await SendRequestAsync<List<MatchDetailsClientModel>>
                (_requestUrlBuilder.BuildGetMatchHistoryUrl(request.SessionId, request.PlayerName));
            await LogUsageStat(ActionNameConstants.GetPlayerMatchHistory);
            return HandleRetMessageReponse(response);
        }

        public async Task<List<PlayerLoadoutsClientModel>> GetClientPlayerLoadoutsAsync(PlayerLoadoutsRequest request)
        {
            var response = await SendRequestAsync<List<PlayerLoadoutsClientModel>>
                (_requestUrlBuilder.BuildGetPlayerLoadoutsUrl(request.SessionId, request.PlayerName, request.LanguageId));
            await LogUsageStat(ActionNameConstants.GetPlayerLoadouts);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<PlayerStatusClientModel>> GetClientPlayerStatusAsync(PlayerBaseRequest request)
        {
            var response = await SendRequestAsync<List<PlayerStatusClientModel>>
                (_requestUrlBuilder.BuildGetPlayerStatusUrl(request.SessionId, request.PlayerName));
            await LogUsageStat(ActionNameConstants.GetPlayerStatus);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<PlayerQueueStatsClientModel>> GetClientPlayerQueueStatsAsync(PlayerQueueStatsRequest request)
        {
            var response = await SendRequestAsync<List<PlayerQueueStatsClientModel>>
                (_requestUrlBuilder.BuildGetQueueStatsUrl(request.SessionId, request.PlayerName, request.QueueId));
            await LogUsageStat(ActionNameConstants.GetPlayerQueueStats);
            return HandleRetMessageReponse(response);
        }
    
    }
}
