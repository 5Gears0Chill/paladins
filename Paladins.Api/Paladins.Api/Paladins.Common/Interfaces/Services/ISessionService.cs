using Paladins.Common.ClientModels;
using Paladins.Common.Dto;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface ISessionService
    {
        Task<Response<SessionClientDTO>> GetClientSessionAsync();
        Task<Response<List<UsageStatisticsClientModel>>> GetUsageStatisticsAsync(BaseRequest request);
    }
}
