using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class MatchHistoryRepository: Repository<PaladinsDbContext>, IMatchHistoryRepository
    {
        public MatchHistoryRepository(IAuditManager auditManager)
            :base(auditManager)
        {
        }

        public async Task<IEnumerable<PlayerMatchHistoryModel>> GetPlayerMatchHistories(PlayerModel playerModel)
        {
            var query = await Context.PlayerMatchHistory
                .Where(x => x.PplayerId == playerModel.PaladinsPlayerId)
                .Select(x => new PlayerMatchHistoryModel 
                {
                    Id = x.Id,
                    Assists = x.Assists,
                    Deaths = x.Deaths,
                    Kills = x.Kills,
                    MatchResult = x.MatchResult,
                    PaladinsChampionId = x.PchampionId,
                    PaladinsMatchId = x.PmatchId,
                    PaladinsPlayerId = x.PplayerId,
                    PlayerId = x.PlayerId
                }).ToListAsync();
            return query;
        }

        public async Task<DataListResult<PlayerMatchHistoryModel>> InsertPlayerMatchHistoryAsync(List<PlayerMatchHistoryModel> model, PlayerModel player)
        {
            var matches = model.Select(x => ToPlayerMatchHistoryEntity(x, player));

            var response = await InsertListAsync(matches);
            return new DataListResult<PlayerMatchHistoryModel>(response.RowsAffected, model);
        }

        /// <summary>
        /// Updates DB with latest match histories.
        /// </summary>
        /// <param name="model">Contains the current list of matchs in the db</param>
        /// <param name="player">Contains the newest matches from the paladins API</param>
        /// <returns></returns>
        public async Task<DataListResult<PlayerMatchHistoryModel>> UpdatePlayerMatchHistoryAsync(List<PlayerMatchHistoryModel> model, PlayerModel player)
        {
            var latestMatches = player.MatchHistories.Select(x => ToPlayerMatchHistoryEntity(x, player));

            var currentMatches = model.Select(x => ToPlayerMatchHistoryEntity(x, player));

            var toBeAdded = latestMatches.Where(x => !currentMatches.Any(d => d.PmatchId == x.PmatchId));
            var response = await InsertListAsync(toBeAdded);
            return new DataListResult<PlayerMatchHistoryModel>(response.RowsAffected, player.MatchHistories);
        }


        private PlayerMatchHistory ToPlayerMatchHistoryEntity(PlayerMatchHistoryModel x, PlayerModel player = null)
        {
            return new PlayerMatchHistory
            {
                Assists = x.Assists,
                Deaths = x.Deaths,
                Id = x.Id,
                Kills = x.Kills,
                MatchResult = x.MatchResult,
                PchampionId = x.PaladinsChampionId,
                PlayerId = player.PlayerId,
                PmatchId = x.PaladinsMatchId,
                PplayerId = x.PaladinsPlayerId,
            };
        }
    }
}
