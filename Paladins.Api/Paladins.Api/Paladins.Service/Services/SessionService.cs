using Paladins.Common.ClientModels;
using Paladins.Common.Dto;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using Paladins.Common.Validation;
using System;
using System.Collections.Generic;
using System.Text;
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

        public async Task<Response<SessionClientDTO>> GetClientSessionAsync()
        {
            var cr = await _sessionClient.GetClientSessionAsync();
            var response = new Response<SessionClientDTO>
            {
                Data = new SessionClientDTO()
                {
                    State = cr.RetMsg,
                    SessionId = cr.SessionId,
                    TimeStamp = cr.Timestamp,
                }
            };

            return response;
        }

        public async Task<Response<List<UsageStatisticsClientModel>>> GetUsageStatisticsAsync(BaseRequest request) 
            => new Response<List<UsageStatisticsClientModel>>
                {
                    Data = await _sessionClient.GetClientUsageStatistics(request.SessionId)
                };
    }
}
