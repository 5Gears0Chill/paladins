using Paladins.Common.ClientModels.Match;
using Paladins.Common.Extensions.UtilityExtensions;
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

namespace Paladins.Service.Services.Mobile
{
    public class MatchMobileService : IMatchMobileService
    {
        private readonly IMatchClient _matchClient;
        private readonly IMapper<MatchDetailsClientModel, MatchDetailsModel> _matchDetailsMapper;
        private readonly ISessionManager _sessionManager;
        private IUnitOfWorkManager _unitOfWorkManager;

        public MatchMobileService(IMapper<MatchDetailsClientModel, MatchDetailsModel> matchDetailsMapper,
            IMatchClient matchClient,
            ISessionManager sessionManager,
            IUnitOfWorkManager unitOfWorkManager)
        {
            _matchClient = matchClient;
            _matchDetailsMapper = matchDetailsMapper;
            _sessionManager = sessionManager;
            _unitOfWorkManager = unitOfWorkManager;
        }

        public async Task<Response<IEnumerable<MatchDetailsModel>>> GetMatchDetailsAsync(MatchBaseRequest request)
        {
            var response = new Response<IEnumerable<MatchDetailsModel>>
            {
                Data = await GetMatchStored(request)
            };
            if (response.Data.IsNotNull())
            {
                return response;
            }
            request.SessionId = await _sessionManager.GetKey();
            var clientResponse = await _matchClient.GetClientMatchDetailsAsync(request);
            response.Data = clientResponse.Select(x => _matchDetailsMapper.Map(x));
            response = await MapChampionDetails(response);
            return response;
        }

        private async Task<IEnumerable<MatchDetailsModel>> GetMatchStored(MatchBaseRequest request)
        {
            var matchDetails = await _unitOfWorkManager.ExecuteSingleAsync
                 <IMatchDetailsRepository, IEnumerable<MatchDetailsModel>>
                 (u => u.GetMatchDetails(request));
            if (matchDetails.Any())
            {
                return matchDetails;
            }
            return null;
        }

        private async Task<Response<IEnumerable<MatchDetailsModel>>> MapChampionDetails(Response<IEnumerable<MatchDetailsModel>> response)
        {
            var championDetails = await _unitOfWorkManager.ExecuteSingleAsync
                 <IChampionRepository, List<ChampionModel>>
                 (u => u.GetChampionsByIdsAsync(new List<int>(from x in response.Data
                                                              select x.PaladinsChampionId)));

            response.Data = response.Data.Select(x => AddChampionDetails(x, championDetails));
            return response;
        }

        private MatchDetailsModel AddChampionDetails(MatchDetailsModel m, List<ChampionModel> champions)
        {
            var c = champions.Where(x => x.PaladinsChampionId == m.PaladinsChampionId).FirstOrDefault();
            m.ChampionIconUrl = c.ChampionIconUrl.AbsoluteUri;
            m.ChampionName = c.Name;
            return m;
        }
    }
}
