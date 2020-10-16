using Paladins.Common.Interfaces.Definitions;
using Paladins.Common.Models.Admin;
using PaladinsAdmin.Framework.Pagination;
using PaladinsAdmin.Framework.Pagination.Builders;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Handlers
{
    public class BaseAdminTableHandler<TModel, TSearchModel>
       where TModel : IModel
       where TSearchModel : BaseSearchModel
    {
        public async Task<PagedList<TModel>> SearchPaginated<TService>(TSearchModel searchModel, TService service, Func<TService, Task<IEnumerable<TModel>>> runQuery)
            where TService : IAdminService
        {
            var builder = BasePagedListBuilder<TModel>.Create(
                query: await runQuery(service),
                pageIndex: searchModel.Page - 1,
                pageSize: searchModel.PageSize,
                getOnlyTotalCount: false
                );
            return new PagedList<TModel>(builder.Query, builder.PageIndex, builder.PageSize, builder.GetOnlyTotalCount);
        }
    }
}
