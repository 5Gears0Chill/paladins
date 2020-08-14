using Paladins.Common.ClientModels.Match;
using Paladins.Common.Requests;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IMatchClient
    {
        Task<List<MatchDetailsClientModel>> GetClientMatchDetailsAsync(MatchBaseRequest request);
        Task<List<MatchDetailsClientModel>> GetClientMatchDetailsBatchAsync(MatchBatchRequest request);
        Task<List<MatchIdsClientModel>> GetClientMatchIdsByQueueAsync(MatchIdsByQueueRequest request);
    }
}
