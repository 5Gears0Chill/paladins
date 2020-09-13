using Paladins.Common.ClientModels.Match;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IMatchService
    {
        Task<Response<List<MatchDetailsModel>>> GetMatchDetailsAsync(MatchBaseRequest request);
        Task<Response<List<MatchDetailsClientModel>>> GetMatchDetailsBatchAsync(MatchBatchRequest request);
        Task<Response<List<MatchIdsClientModel>>> GetMatchIdsByQueueAsync(MatchIdsByQueueRequest request);
    }
}
