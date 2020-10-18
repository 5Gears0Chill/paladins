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
    public class ChangeLogFactory : IChangeLogFactory
    {
        private readonly IChangeLogAdminHandler _changeLogAdminHandler;

        public ChangeLogFactory(IChangeLogAdminHandler changeLogAdminHandler)
        {
            _changeLogAdminHandler = changeLogAdminHandler;
        }
        public async Task<ChangeLogListModel> MakeListModel(ChangeLogAdminSearchModel searchModel)
        {
            var changeLogs = await _changeLogAdminHandler.SearchChangeLog(searchModel);
            var changeLogItems = changeLogs.Select(x => new ChangeLogListItemModel
            {
               EventDate = x.EventDate,
               DatabaseName = x.DatabaseName,
               EventType = x.EventType,
               LoginName = x.LoginName,
               ObjectName = x.ObjectName,
               ObjectType = x.ObjectType,
               SqlCommand = x.SqlCommand
            });
            var changeLogItemsPagedList = new PagedList<ChangeLogListItemModel>(
                    changeLogItems,
                    changeLogs.PageIndex,
                    changeLogs.PageSize,
                    changeLogs.TotalCount
                );
            return new ChangeLogListModel().PrepareToGrid(searchModel, changeLogs, () => changeLogItemsPagedList);
        }
    }
}
