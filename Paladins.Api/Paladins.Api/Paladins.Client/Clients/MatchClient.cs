using Paladins.Common.ClientModels.Match;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Handlers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class MatchClient : BaseClient, IMatchClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public MatchClient(IRequestUrlBuilder requestUrlBuilder, IClientRetMessageHandler clientRetMessageHandler, IUnitOfWorkManager unitOfWorkManager)
            : base(clientRetMessageHandler, unitOfWorkManager)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<MatchDetailsClientModel>> GetClientMatchDetailsAsync(MatchBaseRequest request)
        { 
            var response = await SendRequestAsync<List<MatchDetailsClientModel>>(_requestUrlBuilder.BuildMatchDetailsUrl(request.SessionId, request.MatchId));
            await LogUsageStat(ActionNameConstants.GetMatchDetails);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<MatchDetailsClientModel>> GetClientMatchDetailsBatchAsync(MatchBatchRequest request)
        {
            var response = await SendRequestAsync<List<MatchDetailsClientModel>>(_requestUrlBuilder.BuildMatchDetailsBatchUrl(request.SessionId, request.MatchIds));
            await LogUsageStat(ActionNameConstants.GetMatchDetailsBatch);
            return HandleRetMessageReponse(response);
        }

        public async Task<List<MatchIdsClientModel>> GetClientMatchIdsByQueueAsync(MatchIdsByQueueRequest request)
        {
            var response = await SendRequestAsync<List<MatchIdsClientModel>>(_requestUrlBuilder.BuildMatchIdsByQueueUrl(request.SessionId, request.Queue, request.Date, request.Hour));
            await LogUsageStat(ActionNameConstants.GetMatchIdsByQueue);
            return HandleRetMessageReponse(response);
        }


    }
}
