using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Handlers
{
    public class ChangeLogAdminHandler : BaseAdminTableHandler<ChangeLogModel, ChangeLogAdminSearchModel>, IChangeLogAdminHandler
    {
        private readonly ILogAdminService _logAdminService;

        public ChangeLogAdminHandler(ILogAdminService logAdminService)
        {
            _logAdminService = logAdminService;
        }

        public async Task<PagedList<ChangeLogModel>> SearchChangeLog(ChangeLogAdminSearchModel searchModel)
        {
            return await SearchPaginated(searchModel, _logAdminService, u => u.FetchChangeLogAsync(searchModel));
        }
    }
}
