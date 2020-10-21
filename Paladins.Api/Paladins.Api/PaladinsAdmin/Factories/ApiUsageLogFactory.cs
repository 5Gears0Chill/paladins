using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Factories.Interfaces;
using PaladinsAdmin.Framework.Extensions;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using PaladinsAdmin.Models.Log;
using System.Linq;
using System.Threading.Tasks;

namespace PaladinsAdmin.Factories
{
    public class ApiUsageLogFactory : IApiUsageLogFactory
    {
        private readonly IApiUsageLogAdminHandler _apiUsageLogAdminHandler;

        public ApiUsageLogFactory(IApiUsageLogAdminHandler changeLogAdminHandler)
        {
            _apiUsageLogAdminHandler = changeLogAdminHandler;
        }
        public async Task<ApiUsageLogListModel> MakeListModel(ApiUsageLogAdminSearchModel searchModel)
        {
            var apiUsageLogs = await _apiUsageLogAdminHandler.SearchApiUsageLog(searchModel);
            var apiUsageLogItems = apiUsageLogs.Select(x => new ApiUsageLogListItemModel
            {
              Id = x.Id,
              ActionName = x.ActionName,
              Category = x.Category,
              EventDate = x.EventDate
            });
            var apiUsageLogItemsPagedList = new PagedList<ApiUsageLogListItemModel>(
                    apiUsageLogItems,
                    apiUsageLogs.PageIndex,
                    apiUsageLogs.PageSize,
                    apiUsageLogs.TotalCount
                );
            return new ApiUsageLogListModel().PrepareToGrid(searchModel, apiUsageLogs, () => apiUsageLogItemsPagedList);
        }
    }
}
