using Paladins.Common.ClientModels.Match;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class MatchClient : BaseClient, IMatchClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public MatchClient(IRequestUrlBuilder requestUrlBuilder)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<MatchDetailsClientModel>> GetClientMatchDetailsAsync(MatchBaseRequest request)
            => await SendRequestAsync<List<MatchDetailsClientModel>>(_requestUrlBuilder.BuildMatchDetailsUrl(request.SessionId, request.MatchId));

        public async Task<List<MatchDetailsClientModel>> GetClientMatchDetailsBatchAsync(MatchBatchRequest request)
            => await SendRequestAsync<List<MatchDetailsClientModel>>(_requestUrlBuilder.BuildMatchDetailsBatchUrl(request.SessionId, request.MatchIds));

        public async Task<List<MatchIdsClientModel>> GetClientMatchIdsByQueueAsync(MatchIdsByQueueRequest request)
                  => await SendRequestAsync<List<MatchIdsClientModel>>(_requestUrlBuilder.BuildMatchIdsByQueueUrl(request.SessionId, request.Queue, request.Date, request.Hour));


    }
}
