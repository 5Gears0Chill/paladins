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
    public class ExceptionLogFactory : IExceptionLogFactory
    {
        private readonly IExceptionLogAdminHandler _exceptionLogAdminHandler;

        public ExceptionLogFactory(IExceptionLogAdminHandler exceptionLogAdminHandler)
        {
            _exceptionLogAdminHandler = exceptionLogAdminHandler;
        }

        public async Task<ExceptionLogListModel> MakeListModel(ExceptionLogAdminSearchModel searchModel)
        {
            var exceptionLogs = await _exceptionLogAdminHandler.SearchExceptionLog(searchModel);
            var exceptionLogItems = exceptionLogs.Select(x => new ExceptionLogListItemModel
            {
                ErrorCode = x.ErrorCode,
                ErrorMessage = x.ErrorMessage,
                ErrorType = x.ErrorType,
                EventDate = x.EventDate,
                StackTrace = x.StackTrace
            });
            var exceptionLogItemsPagedList = new PagedList<ExceptionLogListItemModel>(
                    exceptionLogItems,
                    exceptionLogs.PageIndex,
                    exceptionLogs.PageSize,
                    exceptionLogs.TotalCount
                );
            return new ExceptionLogListModel().PrepareToGrid(searchModel, exceptionLogs, () => exceptionLogItemsPagedList);
        }
    }
}
