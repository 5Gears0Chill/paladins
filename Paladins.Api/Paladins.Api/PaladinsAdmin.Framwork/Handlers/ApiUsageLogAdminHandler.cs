using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Handlers
{
    public class ApiUsageLogAdminHandler: BaseAdminTableHandler<ApiUsageModel, ApiUsageLogAdminSearchModel>, IApiUsageLogAdminHandler
    {
        private readonly ILogAdminService _logAdminService;

        public ApiUsageLogAdminHandler(ILogAdminService logAdminService)
        {
            _logAdminService = logAdminService;
        }

        public async Task<PagedList<ApiUsageModel>> SearchApiUsageLog(ApiUsageLogAdminSearchModel searchModel)
        {
            return await SearchPaginated(searchModel, _logAdminService, u => u.FetchApiUsageLogAsync(searchModel));
        }
    }
}
