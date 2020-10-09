using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.Constants;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class MatchDetailsRepository: Repository<PaladinsDbContext>, IMatchDetailsRepository
    {
        public MatchDetailsRepository(IAuditManager auditManager)
            :base(auditManager)
        {
        }

        public async Task<IEnumerable<MatchDetailsModel>> GetMatchDetails(MatchBaseRequest request)
        {
            return await Context.MatchDetails
                .Include(x => x.MatchBans)
                .Include(x => x.LoadoutsSelected)
                .Where(x => x.PmatchId == Convert.ToInt32(request.MatchId))
                .Select(x => new MatchDetailsModel
                {
                    Id = x.Id,
                    Assists = x.Assists,
                    ObjectiveAssists = x.ObjectiveAssists,
                    DamageDoneInHand = x.DamageDoneInHand,
                    DamageMitigated = x.DamageMitigated,
                    DamageTaken = x.DamageTaken,
                    Deaths = x.Deaths,
                    GoldEarnedPerMinute = x.GoldEarnedPerMinute,
                    GoldEarnedTotal = x.GoldEarnedTotal,
                    HasReplay = x.HasReplay,
                    HealingDone = x.HealingDone,
                    ItemsBought = x.ItemsBought.Select(i => new ItemsBoughtModel 
                    {
                       ItemLevel = i.ItemLevel,
                       ItemName = i.ItemName,
                       ItemOrder = i.ItemOrder,
                       PaladinsItemId = i.PitemId,
                    }),
                    KillingSpree = x.KillingSpree,
                    Kills = x.Kills,
                    KillsDouble = x.KillsDouble,
                    KillsPenta = x.KillsPenta,
                    KillsQuadra = x.KillsQuadra,
                    KillsTriple = x.KillsTriple,
                    LeagueWins = x.LeageWins,
                    LeagueLosses = x.LeagueLosses,
                    LeaguePoints = x.LeaguePoints,
                    LeagueTier = x.LeagueTier,
                    Length = x.Length,
                    LengthInMinutes = x.LengthInMinutes,
                    LoadoutSelected = x.LoadoutsSelected.Select(i => new LoadoutSelectedModel 
                    {
                        LoadoutItemLevel = i.LoadoutItemLevel,
                        LoadoutItemName = i.LoadoutItemName,
                        PaladinsItemId = i.PitemId,
                        PaladinsMatchId = i.PmatchId,
                        PaladinsPlayerId = i.PplayerId,
                    }),
                    PaladinsChampionId = x.PchampionId,
                    ChampionName = x.Champion.Name,
                    ChampionIconUrl = x.Champion.Url,
                    PaladinsPlayerId = x.PplayerId,
                    PaladinsMatchId = x.PmatchId,
                    MapGameType = x.MapGameType,
                    MapName = x.MapName,
                    MatchBans = x.MatchBans.Select(i => new MatchBansModel 
                    {
                        BanPosition = i.BanPosition,
                        ChampionName = i.ChampionName,  
                        ChampionIconUrl = i.Pchampion.Url,
                        PaladinsChampionId = i.PchampionId,
                        PaladinsMatchId = i.PmatchId,
                    }),
                    MultiKillMax = x.MultiKillMax,
                    PaladinsChampionSkinId = x.PchampionSkinId,
                    PaladinsQueueId = x.PqueueId,
                    PlayerAccountLevel = x.PlayerAccountLevel,
                    PlayerName = x.PlayerName,
                    Region = x.Region,
                    SelfHealing = x.SelfHealing,
                    TeamOneScore = x.TeamOneScore,
                    TeamTwoScore = x.TeamTwoScore,
                    WinStatus = x.WinStatus
                })
                .ToListAsync();
        }

        public async Task<DataListResult<MatchDetailsModel>> InsertMatchDetailsEntry(IEnumerable<MatchDetailsModel> model, MatchBaseRequest request)
        {
            var matchDetails = model.Select(x => new MatchDetails 
            {
                PlayerMatchHistoryId = request.PlayerMatchHistoryId,
                DamageDoneInHand = x.DamageDoneInHand,
                DamageMitigated = x.DamageMitigated,
                DamageTaken = x.DamageTaken,
                Deaths = x.Deaths,
                GoldEarnedPerMinute = x.GoldEarnedPerMinute,
                GoldEarnedTotal = x.GoldEarnedTotal,
                HasReplay = x.HasReplay,
                HealingDone = x.HealingDone,
                KillingSpree = x.KillingSpree,
                Assists = x.Assists,
                ObjectiveAssists = x.ObjectiveAssists,
                Kills = x.Kills,
                KillsDouble = x.KillsDouble,
                KillsPenta = x.KillsPenta,
                KillsQuadra = x.KillsQuadra,
                KillsTriple = x.KillsTriple,
                LeageWins = x.LeagueWins,
                LeagueLosses = x.LeagueLosses,
                LeaguePoints = x.LeaguePoints,
                LeagueTier = x.LeagueTier,
                Length = x.Length,
                LengthInMinutes = x.LengthInMinutes,
                PchampionId = x.PaladinsChampionId,
                PplayerId = x.PaladinsPlayerId,
                PmatchId = x.PaladinsMatchId,
                MapGameType = x.MapGameType,
                MapName = x.MapName,
                MultiKillMax = x.MultiKillMax,
                PchampionSkinId = x.PaladinsChampionSkinId,
                PqueueId = x.PaladinsQueueId,
                PlayerAccountLevel = x.PlayerAccountLevel,
                PlayerName = x.PlayerName,
                Region = x.Region,
                SelfHealing = x.SelfHealing,
                TeamOneScore = x.TeamOneScore,
                TeamTwoScore = x.TeamTwoScore,
                WinStatus = x.WinStatus,
                ItemsBought = x.ItemsBought.Select(i => new ItemsBought 
                { 
                    ItemLevel = i.ItemLevel,
                    ItemName = i.ItemName,
                    ItemOrder = i.ItemOrder,
                    PitemId = i.PaladinsItemId,
                    IsActive = IsActiveConstants.True,
                }).ToHashSet(),
                MatchBans = x.MatchBans.Where(p => x.MapName.Contains("Ranked")).Select(i => new MatchBans 
                {
                    BanPosition = i.BanPosition,
                    ChampionName = i.ChampionName,
                    PchampionId = i.PaladinsChampionId,
                    PmatchId = i.PaladinsMatchId,
                    IsActive = IsActiveConstants.True,
                }).ToHashSet(),
                LoadoutsSelected = x.LoadoutSelected.Select(i => new LoadoutSelected 
                {
                    LoadoutItemLevel = i.LoadoutItemLevel,
                    LoadoutItemName = i.LoadoutItemName,
                    PitemId = i.PaladinsItemId,
                    PmatchId = i.PaladinsMatchId,
                    PplayerId = i.PaladinsPlayerId,
                    IsActive = IsActiveConstants.True,
                }).ToHashSet(),
            });

            var response = await InsertListAsync(matchDetails);
            return new DataListResult<MatchDetailsModel>(response.RowsAffected, model);
        }
    }
}
