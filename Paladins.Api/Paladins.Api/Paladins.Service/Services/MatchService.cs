using Paladins.Common.ClientModels.Match;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Interfaces.SessionManager;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class MatchService: IMatchService
    {
        private readonly IMatchClient _matchClient;
        private readonly IMapper<MatchDetailsClientModel, MatchDetailsModel> _matchDetailsMapper;
        private IUnitOfWorkManager _unitOfWorkManager;
        private readonly ISessionManager _sessionManager;
        public MatchService(IMatchClient matchClient, IUnitOfWorkManager unitOfWorkManager,
            IMapper<MatchDetailsClientModel, MatchDetailsModel> matchDetailsMapper, ISessionManager sessionManager)
        {
            _matchClient = matchClient;
            _matchDetailsMapper = matchDetailsMapper;
            _unitOfWorkManager = unitOfWorkManager;
            _sessionManager = sessionManager;
        }

        public async Task<Response<List<MatchDetailsModel>>> GetMatchDetailsAsync(MatchBaseRequest request)
        {
            request.SessionId = await _sessionManager.GetKey();
            var response = new Response<List<MatchDetailsModel>>();
            var matchDetails = await _unitOfWorkManager.ExecuteSingleAsync
                <IMatchDetailsRepository, IEnumerable<MatchDetailsModel>>
                (u => u.GetMatchDetails(request));
            if (matchDetails.Any())
            {
                response.Data = matchDetails.ToList();
            }
            else
            {
                var clientResponse = await _matchClient.GetClientMatchDetailsAsync(request);
                var mapped = clientResponse.Select(x => _matchDetailsMapper.Map(x));
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <IMatchDetailsRepository, DataListResult<MatchDetailsModel>>
                        (u => u.InsertMatchDetailsEntry(mapped, request));
                var detailedMatch = await _unitOfWorkManager.ExecuteSingleAsync
                  <IMatchDetailsRepository, IEnumerable<MatchDetailsModel>>
                  (u => u.GetMatchDetails(request));
                response.Data = detailedMatch.ToList();
            }
            return response;
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
