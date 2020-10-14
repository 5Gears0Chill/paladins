using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using PaladinsAdmin.Framework.Pagination.Builders;
using System.Threading.Tasks;

namespace PaladinsAdmin.Framework.Factories
{
    public class PlayerAdminHandler : IPlayerAdminHandler
    {
        private readonly IPlayerAdminService _playerAdminService;

        public PlayerAdminHandler(IPlayerAdminService playerAdminService)
        {
            _playerAdminService = playerAdminService;
        }

        public async Task<PagedList<PlayerModel>> SearchPlayers(PlayerAdminSearchModel searchModel)
        {
            var builder = PlayerPagedListBuilder.Create(
                query: await _playerAdminService.GetPlayerAsync(searchModel),
                pageIndex: searchModel.Page - 1,
                pageSize: searchModel.PageSize,
                getOnlyTotalCount: false
                );
            return new PagedList<PlayerModel>(builder.Query, builder.PageIndex, builder.PageSize, builder.GetOnlyTotalCount);
        }
    }
}
