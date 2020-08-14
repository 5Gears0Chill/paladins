using Paladins.Common.ClientModels.Match;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class MatchService: IMatchService
    {
        private readonly IMatchClient _matchClient;

        public MatchService(IMatchClient matchClient)
        {
            _matchClient = matchClient;
        }

        public async Task<Response<List<MatchDetailsClientModel>>> GetMatchDetailsAsync(MatchBaseRequest request)
        {
            var response = await _matchClient.GetClientMatchDetailsAsync(request);
            return new Response<List<MatchDetailsClientModel>> { Data = response };
        }
        
        public async Task<Response<List<MatchDetailsClientModel>>> GetMatchDetailsBatchAsync(MatchBatchRequest request)
        {
            var response = await _matchClient.GetClientMatchDetailsBatchAsync(request);
            return new Response<List<MatchDetailsClientModel>> { Data = response };
        }

        public async Task<Response<List<MatchIdsClientModel>>> GetMatchIdsByQueueAsync(MatchIdsByQueueRequest request)
        {
            var response = await _matchClient.GetClientMatchIdsByQueueAsync(request);
            return new Response<List<MatchIdsClientModel>> { Data = response };
        }

    }
}
