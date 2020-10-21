using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service.Services.Admin
{
    public class LogAdminService : ILogAdminService
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public LogAdminService(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;
        }

        public async Task<IEnumerable<ChangeLogModel>> FetchChangeLogAsync(ChangeLogAdminSearchModel model)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync<IChangeLogRepository, IEnumerable<ChangeLogModel>>
                (u => u.GetChangeLogAsync(model));
        }
        public async Task<IEnumerable<ExceptionLogModel>> FetchExceptionLogAsync(ExceptionLogAdminSearchModel model)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync<IExceptionLogRepository, IEnumerable<ExceptionLogModel>>
                (u => u.GetExceptionLogAsync(model));
        }

        public async Task<IEnumerable<ApiUsageModel>> FetchApiUsageLogAsync(ApiUsageLogAdminSearchModel model)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync<IApiUsageFrequencyRepository, IEnumerable<ApiUsageModel>>
                (u => u.GetApiUsageAsync(model));
        }
    }
}
