using Paladins.Common.ClientModels;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class SessionService : ISessionService
    {
        private readonly ISessionClient _sessionClient;
        public SessionService(ISessionClient sessionClient)
        {
            _sessionClient = sessionClient;
        }

        public async Task<Response<SessionClientModel>> GetClientSessionAsync()
        {
            var cr = await _sessionClient.GetClientSessionAsync();
            return new Response<SessionClientModel>() { Data = cr };
        }

        public async Task<Response<List<UsageStatisticsClientModel>>> GetUsageStatisticsAsync(BaseRequest request) 
            => new Response<List<UsageStatisticsClientModel>>
                {
                    Data = await _sessionClient.GetClientUsageStatistics(request.SessionId)
                };
    }
}
