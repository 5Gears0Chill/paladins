using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Factories.Interfaces;
using PaladinsAdmin.Framework.Extensions;
using PaladinsAdmin.Framework.Interfaces.Handlers;
using PaladinsAdmin.Framework.Pagination;
using PaladinsAdmin.Models.Player;
using System.Linq;
using System.Threading.Tasks;

namespace PaladinsAdmin.Factories
{
    public class PlayerModelFactory : IPlayerModelFactory
    {
        private readonly IPlayerAdminHandler _playerAdminHandler;

        public PlayerModelFactory(IPlayerAdminHandler playerAdminHandler)
        {
            _playerAdminHandler = playerAdminHandler;
        }

        public async Task<PlayerListModel> MakeListModel(PlayerAdminSearchModel searchModel)
        {
            var players = await _playerAdminHandler.SearchPlayers(searchModel);
            var playerItems = players.Select(x => new PlayerListItemModel
            {
                AccountCreatedOnTimeStamp = x.AccountCreatedOnTimeStamp,
                AccountLevel = x.AccountLevel,
                HoursPlayed = x.HoursPlayed,
                LastLoginTimeStamp = x.LastLoginTimeStamp,
                MinutesPlayed = x.MinutesPlayed,
                Name = x.Name,
                PaladinsPlayerId = x.PaladinsPlayerId,
                TotalLeaves = x.TotalLeaves,
                TotalWins = x.TotalWins
            });
            var playerItemsPagedList = new PagedList<PlayerListItemModel>(
                    playerItems,
                    players.PageIndex,
                    players.PageSize,
                    players.TotalCount
                );
            return new PlayerListModel().PrepareToGrid(searchModel, players, () => playerItemsPagedList);
        }
    }
}
