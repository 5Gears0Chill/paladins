using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class LoadoutRepository : Repository<PaladinsDbContext>, ILoadoutRepository
    {
        public LoadoutRepository(IAuditManager auditManager)
            :base(auditManager)
        {
        }

        public async Task<PagedResponse<PlayerLoadoutModel>> GetPagedLoadoutsAsync(PlayerPagedRequest request, PlayerModel model)
        {
            var loadouts = await Context.Loadout
                 .Include(x => x.LoadoutItem)
                 .Include(x => x.Champion)
                 .Where(x => x.PlayerName.Contains(request.PlayerName))
                    .Select(x => new PlayerLoadoutModel
                    {
                        Id = x.Id,
                        PaladinsPlayerId = x.PplayerId,
                        LoadoutName = x.LoadoutName,
                        PaladinsLoadoutId = x.PloadoutId,
                        PlayerName = x.PlayerName,
                        PaladinsChampionId = x.PchampionId,
                        ChampionName = x.Champion.Name,
                        ChampionUrl = x.Champion.Url,
                        CreatedOn = x.CreatedOn,
                        LastUpdatedOn = x.LastUpdatedOn,
                        LoadoutItems = (from loadoutItem in x.LoadoutItem
                                        select new PlayerLoadoutItemModel
                                        {
                                            CardName = loadoutItem.Name,
                                            PaladinsItemId = loadoutItem.PitemId,
                                            ItemName = loadoutItem.Item.DeviceName,
                                            ItemUrl = loadoutItem.Item.ItemIconUrl,
                                            Description = loadoutItem.Item.Description,
                                            PointsAssignedToItem = loadoutItem.Points
                                        }).ToList()

                    })
                    .OrderBy(x => x.ChampionName)
                    .ToListAsync();

            return new PagedResponse<PlayerLoadoutModel>(loadouts, request);
        }

        public async Task<IEnumerable<PlayerLoadoutModel>> GetPlayerLoadoutAsync(PlayerModel model)
        {
            var response = await Context.Loadout
                .Include(x => x.LoadoutItem)
                .Where(x => x.PplayerId == model.PaladinsPlayerId)
                .Select(x => new PlayerLoadoutModel
                    {
                        Id = x.Id,
                        PaladinsPlayerId = x.PplayerId,
                        LoadoutName = x.LoadoutName,
                        PaladinsLoadoutId = x.PloadoutId,
                        PlayerName = x.PlayerName,
                        PaladinsChampionId = x.PchampionId,
                        CreatedOn = x.CreatedOn,
                        LastUpdatedOn = x.LastUpdatedOn,
                        LoadoutItems = (from item in x.LoadoutItem
                                        select new PlayerLoadoutItemModel
                                        {
                                            Id = item.Id,
                                            CardName = item.Name,
                                            PaladinsItemId = item.PitemId,
                                            PointsAssignedToItem = item.Points
                                        }).ToList()

                    })
                .ToListAsync();
            return response;
        }


        public async Task<DataListResult<PlayerLoadoutModel>> InsertPlayerLoadoutAsync(List<PlayerLoadoutModel> model)
        {
            var loadouts = model.Select(x => new Loadout
            {
                PchampionId = x.PaladinsChampionId,
                LoadoutName = x.LoadoutName,
                PloadoutId = x.PaladinsLoadoutId,
                PplayerId = x.PaladinsPlayerId,
                PlayerName = x.PlayerName,
                LoadoutItem = (from item in x.LoadoutItems
                               select new LoadoutItem
                               {
                                   PitemId = item.PaladinsItemId,
                                   Name = item.CardName,
                                   Points = item.PointsAssignedToItem,
                                   IsActive = true
                               }).ToHashSet()
            });
            var response = await InsertListAsync(loadouts);
            return new DataListResult<PlayerLoadoutModel>(response.RowsAffected, model);
        }

        public async Task<DataListResult<PlayerLoadoutModel>> UpdatePlayerLoadoutAsync(List<PlayerLoadoutModel> model)
        {
            var loadouts = model.Select(x => new Loadout
            {
                Id = x.Id,
                PchampionId = x.PaladinsChampionId,
                LoadoutName = x.LoadoutName,
                PloadoutId = x.PaladinsLoadoutId,
                PplayerId = x.PaladinsPlayerId,
                PlayerName = x.PlayerName,
                CreatedOn = x.CreatedOn,
                LastUpdatedOn = x.LastUpdatedOn,
                LoadoutItem = (from item in x.LoadoutItems
                               select new LoadoutItem
                               {
                                   Id = item.Id,
                                   PitemId = item.PaladinsItemId,
                                   Name = item.CardName,
                                   Points = item.PointsAssignedToItem,
                                   IsActive = true
                               }).ToHashSet()
            });
            var response = await UpdateListAsync(loadouts);
            return new DataListResult<PlayerLoadoutModel>(response.RowsAffected, model);
        }
    }
}
