using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Interfaces.Handlers
{
    public interface IApiUsageLogAdminHandler
    {
        Task<PagedList<ApiUsageModel>> SearchApiUsageLog(ApiUsageLogAdminSearchModel searchModel);
    }
}
