using Paladins.Common.ClientModels.Match;
using Paladins.Common.Constants;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Common.Mappers
{
    public class MatchDetailsMapper : IMapper<MatchDetailsClientModel, MatchDetailsModel>
    {
        public MatchDetailsModel Map(MatchDetailsClientModel m)
        {
            return new MatchDetailsModel
            {
                DamageDoneInHand = Convert.ToInt32(m.DamageDoneInHand),
                DamageMitigated = Convert.ToInt32(m.DamageMitigated),
                DamageTaken = Convert.ToInt32(m.DamageTaken),
                Deaths = Convert.ToInt32(m.Deaths),
                GoldEarnedPerMinute = Convert.ToInt32(m.GoldPerMinute),
                GoldEarnedTotal = Convert.ToInt32(m.GoldEarned),
                HasReplay = m.HasReplay,
                HealingDone = Convert.ToInt32(m.Healing),
                KillingSpree = Convert.ToInt32(m.KillingSpree),
                Kills = Convert.ToInt32(m.KillsPlayer),
                KillsDouble = Convert.ToInt32(m.KillsDouble),
                KillsPenta = Convert.ToInt32(m.KillsPenta),
                KillsQuadra = Convert.ToInt32(m.KillsQuadra),
                KillsTriple = Convert.ToInt32(m.KillsTriple),
                LeagueWins = Convert.ToInt32(m.LeagueWins),
                LeagueLosses = Convert.ToInt32(m.LeagueLosses),
                LeaguePoints = Convert.ToInt32(m.LeaguePoints),
                LeagueTier = Convert.ToInt32(m.LeagueTier),
                Length = Convert.ToInt32(m.TimeInMatchSeconds),
                LengthInMinutes = Convert.ToInt32(m.Minutes),
                MapGameType = m.Name,
                MapName = m.MapGame,
                MultiKillMax = Convert.ToInt32(m.MultiKillMax),
                PaladinsChampionId = Convert.ToInt32(m.ChampionId),
                PaladinsChampionSkinId = Convert.ToInt32(m.SkinId),
                PaladinsMatchId = Convert.ToInt32(m.Match),
                PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                PaladinsQueueId = Convert.ToInt32(m.MatchQueueId),
                PlayerAccountLevel = Convert.ToInt32(m.AccountLevel),
                PlayerName = m.PlayerName,
                Region = m.Region,
                SelfHealing = Convert.ToInt32(m.HealingPlayerSelf),
                TeamOneScore = Convert.ToInt32(m.Team1Score),
                TeamTwoScore = Convert.ToInt32(m.Team2Score),
                WinStatus = m.WinStatus,
                Assists = Convert.ToInt32(m.Assists),
                ObjectiveAssists = Convert.ToInt32(m.ObjectiveAssists),
                ItemsBought = MapItemsBought(m),
                LoadoutSelected = MapLoadoutSelected(m),
                MatchBans = MapMatchBans(m),
            };
        }

        private IEnumerable<MatchBansModel> MapMatchBans(MatchDetailsClientModel m)
        {
            if (m.IsNotRankedMatch())
            {
                return null;
            }
            return new List<MatchBansModel>
            {
                new MatchBansModel
                {
                    BanPosition = (int) PositionEnum.FirstPosition,
                    PaladinsChampionId = Convert.ToInt32(m.BanId1),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    ChampionName = Convert.ToString(m.Ban1),
                },
                new MatchBansModel
                {
                    BanPosition = (int) PositionEnum.SecondPosition,
                    PaladinsChampionId = Convert.ToInt32(m.BanId2),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    ChampionName = Convert.ToString(m.Ban2),
                },
                new MatchBansModel
                {
                    BanPosition = (int) PositionEnum.ThirdPosition,
                    PaladinsChampionId = Convert.ToInt32(m.BanId3),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    ChampionName = Convert.ToString(m.Ban3),
                },
                new MatchBansModel
                {
                    BanPosition = (int) PositionEnum.FourthPosition,
                    PaladinsChampionId = Convert.ToInt32(m.BanId4),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    ChampionName = Convert.ToString(m.Ban4),
                },
            };
        }

        private IEnumerable<LoadoutSelectedModel> MapLoadoutSelected(MatchDetailsClientModel m)
        {
            return new List<LoadoutSelectedModel> 
            {
                new LoadoutSelectedModel
                {
                    LoadoutItemLevel = Convert.ToInt32(m.ItemLevel1),
                    LoadoutItemName = m.ItemPurch1,
                    PaladinsItemId = Convert.ToInt32(m.ItemId1),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                },
                new LoadoutSelectedModel
                {
                    LoadoutItemLevel = Convert.ToInt32(m.ItemLevel2),
                    LoadoutItemName = m.ItemPurch2,
                    PaladinsItemId = Convert.ToInt32(m.ItemId2),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                },
                new LoadoutSelectedModel
                {
                    LoadoutItemLevel = Convert.ToInt32(m.ItemLevel3),
                    LoadoutItemName = m.ItemPurch3,
                    PaladinsItemId = Convert.ToInt32(m.ItemId3),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                },
                new LoadoutSelectedModel
                {
                    LoadoutItemLevel = Convert.ToInt32(m.ItemLevel4),
                    LoadoutItemName = m.ItemPurch4,
                    PaladinsItemId = Convert.ToInt32(m.ItemId4),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                },
                new LoadoutSelectedModel
                {
                    LoadoutItemLevel = Convert.ToInt32(m.ItemLevel5),
                    LoadoutItemName = m.ItemPurch5,
                    PaladinsItemId = Convert.ToInt32(m.ItemId5),
                    PaladinsMatchId = Convert.ToInt32(m.Match),
                    PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                },

            };
        }

        private IEnumerable<ItemsBoughtModel> MapItemsBought(MatchDetailsClientModel m)
        {
            return new List<ItemsBoughtModel>
            {
                new ItemsBoughtModel
                {
                    PaladinsItemId = Convert.ToInt32(m.ActiveId1),
                    ItemLevel = Convert.ToInt32(m.ItemLevel1),
                    ItemName = m.ItemActive1,
                    ItemOrder = (int) PositionEnum.FirstPosition
                },
                new ItemsBoughtModel
                {
                    PaladinsItemId = Convert.ToInt32(m.ActiveId2),
                    ItemLevel = Convert.ToInt32(m.ItemLevel2),
                    ItemName = m.ItemActive2,
                    ItemOrder = (int) PositionEnum.SecondPosition
                },
                new ItemsBoughtModel
                {
                    PaladinsItemId = Convert.ToInt32(m.ActiveId3),
                    ItemLevel = Convert.ToInt32(m.ItemLevel3),
                    ItemName = m.ItemActive3,
                    ItemOrder = (int) PositionEnum.ThirdPosition
                },
                new ItemsBoughtModel
                {
                    PaladinsItemId = Convert.ToInt32(m.ActiveId4),
                    ItemLevel = Convert.ToInt32(m.ItemLevel4),
                    ItemName = m.ItemActive4,
                    ItemOrder = (int) PositionEnum.FourthPosition
                },
            };
        }
    }
}
