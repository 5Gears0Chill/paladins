using Paladins.Common.Interfaces.Definitions;
using System.Collections.Generic;
using System.Linq;

namespace PaladinsAdmin.Framework.Pagination.Builders
{
    public class BasePagedListBuilder<T> where T : IModel
    {
        public IEnumerable<T> Query { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public bool GetOnlyTotalCount { get; set; }

        public static BasePagedListBuilder<T> Create(IEnumerable<T> query, int pageIndex, int pageSize, bool getOnlyTotalCount)
        {
            return new BasePagedListBuilder<T>
            {
                Query = query,
                GetOnlyTotalCount = getOnlyTotalCount,
                PageIndex = pageIndex,
                PageSize = pageSize
            };
        }
    }
}
