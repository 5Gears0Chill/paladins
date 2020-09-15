using Paladins.Common.ClientModels;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface ISessionService
    {
        Task<Response<SessionClientModel>> GetClientSessionAsync();
        Task<Response<List<UsageStatisticsClientModel>>> GetUsageStatisticsAsync(BaseRequest request);
    }
}
