using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Interfaces.Handlers
{
    public interface IPlayerAdminHandler
    {
        Task<PagedList<PlayerModel>> SearchPlayers(PlayerAdminSearchModel searchModel);
    }
}
