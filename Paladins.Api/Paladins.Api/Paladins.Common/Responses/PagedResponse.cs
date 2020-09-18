using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Requests.Controllers;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Common.Responses
{
    public class PagedResponse<TItemType>
    {
        public IEnumerable<TItemType> Data { get; private set; }
        public int TotalRows { get; private set; }
        public PagedResponse(IEnumerable<TItemType> t, PagedRequest request) 
        {
            Data = t.PageEnumerable(request.PageNumber,request.PageSize);
            TotalRows = t.Count();
        }
    }
}
