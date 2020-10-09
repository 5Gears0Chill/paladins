using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Repository.Mappers.Players
{
    public class EFPlayerMapper : IMapper<Player, PlayerModel>
    {
        public PlayerModel Map(Player p)
        {
            return new PlayerModel
            {
                AccountCreatedOnTimeStamp = p.AccountCreatedOnTimeStamp,
                AccountLevel = p.AccountLevel,
                AvatarId = p.AvatarId,
                AvatarUrl = p.AvatarUrl.IsNullOrWhiteSpace() ? null : new Uri(p.AvatarUrl),
                ConquestTier = p.ConquestTier,
                ControllerTier = p.ControllerTier,
                HoursPlayed = p.HoursPlayed,
                KbmTier = p.KbmTier,
                LastLoginTimeStamp = p.LastLoginTimeStamp,
                MasteryLevel = p.MasteryLevel,
                LoadingFrame = p.LoadingFrame,
                Name = p.Name,
                PersonalStatusMessage = p.PersonalStatusMessage,
                MinutesPlayed = p.MinutesPlayed,
                TotalLeaves = p.TotalLeaves,
                TotalWins = p.TotalWins,
                TotalWorshippers = p.TotalWorshippers,
                TotalXp = p.TotalXp,
                PlayerId = p.Id,
                PaladinsPlayerId = p.PplayerId,
                LastUpdatedOn = p.LastUpdatedOn,
                CreatedOn = p.CreatedOn,
                IsActive = p.IsActive,
                RankDetailsModel = MapRankedDetailsModel(p.PlayerRankDetails)
            };
        }

        private List<RankDetailsModel> MapRankedDetailsModel(ICollection<PlayerRankDetails> playerRankedDetails)
        {
            if(playerRankedDetails != null && playerRankedDetails.Count > 0)
            {
                return playerRankedDetails.Select(r => new RankDetailsModel
                {
                    Leaves = r.Leaves,
                    Losses = r.Losses,
                    Points = r.Points,
                    PreviousRank = r.PreviousRank,
                    Rank = r.Rank,
                    RankedName = r.RankName,
                    Season = r.Season,
                    Tier = r.Tier,
                    Trend = r.Trend,
                    Wins = r.Wins
                }).ToList();
            }
            return new List<RankDetailsModel>();
        }
    }
}
