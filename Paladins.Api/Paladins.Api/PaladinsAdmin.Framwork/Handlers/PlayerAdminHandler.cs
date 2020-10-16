using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Handlers;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Factories
{
    public class PlayerAdminHandler : BaseAdminTableHandler<PlayerModel, PlayerAdminSearchModel>, IPlayerAdminHandler
    {
        private readonly IPlayerAdminService _playerAdminService;

        public PlayerAdminHandler(IPlayerAdminService playerAdminService)
        {
            _playerAdminService = playerAdminService;
        }

        public async Task<PagedList<PlayerModel>> SearchPlayers(PlayerAdminSearchModel searchModel)
        {
           return await SearchPaginated(searchModel, _playerAdminService, u => u.GetPlayerAsync(searchModel));      
        }
    }
}
