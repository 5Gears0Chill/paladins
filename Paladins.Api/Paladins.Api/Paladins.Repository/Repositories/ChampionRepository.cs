using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class ChampionRepository: Repository<PaladinsDbContext>, IChampionRepository
    {
        private readonly IMapper<ChampionModel, Champion> _championEFMapper;
        private readonly IMapper<PlayerChampionStatsModel, PlayerChampionStats> _championStatsMapper;
        public ChampionRepository(IAuditManager auditManager, 
            IMapper<ChampionModel, Champion> mapper, 
            IMapper<PlayerChampionStatsModel, PlayerChampionStats> championStatsMapper)
            : base(auditManager)
        {
            _championEFMapper = mapper;
            _championStatsMapper = championStatsMapper;
        }

        public async Task<NonDataResult> InsertChampionsAsync(IEnumerable<ChampionModel> champions)
        {
            var filtered = champions
               .DistinctBy(champion => champion.PaladinsChampionId)
               .Select(x => _championEFMapper.Map(x));
            return await InsertListAsync(filtered);
        }

        public async Task<DataListResult<PlayerChampionStatsModel>> InsertPlayerChampionStatsAsync(List<PlayerChampionStatsModel> model, PlayerModel player)
        {
            var stats = model.Select(c => new PlayerChampionStats
            {
                Assists = c.Assists,
                CreatedOn = c.CreatedOn,
                Deaths = c.Deaths,
                Id = c.Id,
                Kills = c.Kills,
                LastUpdatedOn = c.LastUpdatedOn,
                Losses = c.Losses,
                PchampionId = c.PaladinsChampionId,
                PlayerId = player.PlayerId,
                Rank = c.Rank,
                Wins = c.Wins
            });
            var response = await InsertListAsync(stats);
            return new DataListResult<PlayerChampionStatsModel>(response.RowsAffected, model);
        }

        public async Task<DataListResult<PlayerChampionStatsModel>> UpdatePlayerChampionStatsAsync(List<PlayerChampionStatsModel> model, PlayerModel player)
        {
            var stats = model.Select(x => _championStatsMapper.Map(x))
                 .Select(x => new PlayerChampionStats
                 {
                     Assists = x.Assists,
                     Deaths = x.Deaths,
                     Id = x.Id,
                     IsActive = x.IsActive,
                     CreatedOn = x.CreatedOn,
                     Kills = x.Kills,
                     LastUpdatedOn = x.LastUpdatedOn,
                     Champion = x.Champion,
                     PlayerId = player.PlayerId,
                     Rank = x.Rank,
                     Wins = x.Wins,
                     PchampionId = x.PchampionId,
                     Losses = x.Losses
                 });
            var response = await UpdateListAsync(stats);
            return new DataListResult<PlayerChampionStatsModel>(response.RowsAffected, model);
        }

        public async Task<IEnumerable<PlayerChampionStatsModel>> GetPlayerChampionStatsAsync(PlayerModel player)
        {
            var response = await Context.PlayerChampionStats
                .Where(x => x.PlayerId == player.PlayerId)
                .Select(x => new PlayerChampionStatsModel
                {
                    Assists = x.Assists,
                    CreatedOn = x.CreatedOn,
                    Deaths = x.Deaths,
                    Id = x.Id,
                    Kills = x.Kills,
                    LastUpdatedOn = x.LastUpdatedOn,
                    Losses = x.Losses,
                    PaladinsChampionId = x.PchampionId,
                    PlayerId = x.PlayerId,
                    Rank = x.Rank,
                    Wins = x.Wins
                }).ToListAsync();
            return response;
        }

        public async Task<PagedResponse<ChampionModel>> GetChampionsAsync(PagedRequest request)
        {
            var query = await Context.ChampionAbilities
                .Include(x => x.Champion)
                .Include(x => x.Ability)
                .Select(x => new ChampionModel
                {
                    ChampionIconUrl = new Uri(x.Champion.Url),
                    Id = x.Champion.Id,
                    Health = x.Champion.Health,
                    LatestChampion = x.Champion.IsLatestChampion,
                    Lore = x.Champion.Lore,
                    Name = x.Champion.Name,
                    PaladinsChampionId = x.Champion.PchampionId,
                    Role = x.Champion.Role,
                    Speed = x.Champion.Speed,
                    Title = x.Champion.Title,
                    Abilities = x.Champion.ChampionAbilities.Select(i => new AbilityModel
                    {
                        Description = i.Ability.Description,
                        PaladinsAbilityId = i.Ability.PabilityId,
                        Name = i.Ability.Name,
                        Url = new Uri(i.Ability.Url)
                    })
                }).ToListAsync();

            var filtered = query.AsEnumerable().DistinctBy(x => x.Id);
            return new PagedResponse<ChampionModel>(filtered, request);
        }

        public async Task<PagedResponse<PlayerChampionStatsModel>> GetPagedPlayerChampionStats(PlayerPagedRequest request, PlayerModel model)
        {
            var response = await Context.PlayerChampionStats
                    .Include(x => x.Champion)
                    .Where(x => x.PlayerId == model.PlayerId)
                    .Select(x => new PlayerChampionStatsModel
                    {
                        Assists = x.Assists,
                        CreatedOn = x.CreatedOn,
                        Deaths = x.Deaths,
                        Id = x.Id,
                        Kills = x.Kills,
                        LastUpdatedOn = x.LastUpdatedOn,
                        Losses = x.Losses,
                        PaladinsChampionId = x.PchampionId,
                        ChampionName = x.Champion.Name,
                        ChampionUrl = x.Champion.Url,
                        PlayerId = x.PlayerId,
                        Rank = x.Rank,
                        Wins = x.Wins
                    }).ToListAsync();

            return new PagedResponse<PlayerChampionStatsModel>(response, request);
        }
    }
}
