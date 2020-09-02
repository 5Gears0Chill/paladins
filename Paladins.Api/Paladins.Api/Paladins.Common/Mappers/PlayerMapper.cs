using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Paladins.Common.Mappers
{
    public class PlayerMapper : IMapper<PlayerClientModel, PlayerModel>
    {
        public PlayerModel Map(PlayerClientModel p)
        {
            return new PlayerModel
            {
                AccountLevel = Convert.ToInt32(p.Level),
                AvatarId = Convert.ToInt32(p.AvatarId),
                AvatarUrl = p.AvatarUrl,
                HoursPlayed = Convert.ToInt32(p.HoursPlayed),
                LastLoginTimeStamp = DateTime.ParseExact(p.LastLoginDatetime, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
                AccountCreatedOnTimeStamp = DateTime.ParseExact(p.CreatedDatetime, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
                LoadingFrame = p.LoadingFrame,
                MasteryLevel = Convert.ToInt32(p.MasteryLevel),
                MinutesPlayed = Convert.ToInt32(p.MasteryLevel),
                Name = p.Name,
                PaladinsPlayerId = Convert.ToInt32(p.Id),
                PersonalStatusMessage = p.PersonalStatusMessage,
                ConquestTier = Convert.ToInt32(p.TierConquest),
                ControllerTier = Convert.ToInt32(p.TierRankedController),
                KbmTier = Convert.ToInt32(p.TierRankedKbm),
                TotalLeaves = Convert.ToInt32(p.Leaves),
                TotalWins = Convert.ToInt32(p.Wins),
                TotalWorshippers = Convert.ToInt32(p.TotalWorshippers),
                TotalXp = Convert.ToInt32(p.TotalXp),
                RankDetailsModel = new List<RankDetailsModel>
                {
                    new RankDetailsModel
                    {
                        Leaves = Convert.ToInt32(p.RankedKbm.Leaves),
                        Losses = Convert.ToInt32(p.RankedKbm.Losses),
                        Points = Convert.ToInt32(p.RankedKbm.Points),
                        PreviousRank = Convert.ToInt32(p.RankedKbm.PrevRank),
                        Rank = Convert.ToInt32(p.RankedKbm.Rank),
                        RankedName = p.RankedKbm.Name,
                        Season = Convert.ToInt32(p.RankedKbm.Season),
                        Tier = Convert.ToInt32(p.RankedKbm.Tier),
                        Trend = Convert.ToInt32(p.RankedKbm.Trend),
                        Wins = Convert.ToInt32(p.RankedKbm.Wins)
                    },
                    new RankDetailsModel
                    {
                        Leaves = Convert.ToInt32(p.RankedController.Leaves),
                        Losses = Convert.ToInt32(p.RankedController.Losses),
                        Points = Convert.ToInt32(p.RankedController.Points),
                        PreviousRank = Convert.ToInt32(p.RankedController.PrevRank),
                        Rank = Convert.ToInt32(p.RankedController.Rank),
                        RankedName = p.RankedController.Name,
                        Season = Convert.ToInt32(p.RankedController.Season),
                        Tier = Convert.ToInt32(p.RankedController.Tier),
                        Trend = Convert.ToInt32(p.RankedController.Trend),
                        Wins = Convert.ToInt32(p.RankedController.Wins)
                    },
                    new RankDetailsModel
                    {
                        Leaves = Convert.ToInt32(p.RankedConquest.Leaves),
                        Losses = Convert.ToInt32(p.RankedConquest.Losses),
                        Points = Convert.ToInt32(p.RankedConquest.Points),
                        PreviousRank = Convert.ToInt32(p.RankedConquest.PrevRank),
                        Rank = Convert.ToInt32(p.RankedConquest.Rank),
                        RankedName = p.RankedConquest.Name,
                        Season = Convert.ToInt32(p.RankedConquest.Season),
                        Tier = Convert.ToInt32(p.RankedConquest.Tier),
                        Trend = Convert.ToInt32(p.RankedConquest.Trend),
                        Wins = Convert.ToInt32(p.RankedConquest.Wins)
                    },
                }
            };
        }
    }
}
