using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Handlers
{
    public class ExceptionLogAdminHandler : BaseAdminTableHandler<ExceptionLogModel, ExceptionLogAdminSearchModel>, IExceptionLogAdminHandler
    {
        private readonly ILogAdminService _logAdminService;

        public ExceptionLogAdminHandler(ILogAdminService logAdminService)
        {
            _logAdminService = logAdminService;
        }

        public async Task<PagedList<ExceptionLogModel>> SearchExceptionLog(ExceptionLogAdminSearchModel searchModel)
        {
            return await SearchPaginated(searchModel, _logAdminService, u => u.FetchExceptionLogAsync(searchModel));
        }
    }
}
