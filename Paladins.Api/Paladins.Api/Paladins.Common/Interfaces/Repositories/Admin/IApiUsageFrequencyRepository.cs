using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories.Admin
{
    public interface IApiUsageFrequencyRepository : IRepositoryCore
    {
        Task<ActionEndPointModel> GetActionAsync(string actionName);
        Task<bool> InsertUsage(int actionEndPointId);
        Task<IEnumerable<ApiUsageModel>> GetApiUsageAsync(ApiUsageLogAdminSearchModel model);
    }
}
