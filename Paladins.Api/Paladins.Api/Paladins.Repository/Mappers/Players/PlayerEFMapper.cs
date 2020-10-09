using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;
using System;
using System.Linq;

namespace Paladins.Repository.Mappers.Players
{
    public class PlayerEFMapper : IMapper<PlayerModel, Player>
    {
        public Player Map(PlayerModel p)
        {
            return new Player
            {
                Id = !p.PlayerId.IsNull() ? p.PlayerId : 0,
                AccountCreatedOnTimeStamp = p.AccountCreatedOnTimeStamp,
                AccountLevel = p.AccountLevel,
                AvatarId = p.AvatarId,
                AvatarUrl = p.AvatarUrl.IsNotNull() ? p.AvatarUrl.AbsoluteUri : string.Empty,
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
                PplayerId = p.PaladinsPlayerId,
                LastUpdatedOn = !p.LastUpdatedOn.IsNull() ? p.LastUpdatedOn : DateTime.UtcNow,
                CreatedOn = !p.CreatedOn.IsNull() ? p.CreatedOn : DateTime.UtcNow,
                IsActive = p.IsActive.IsNull() || p.IsActive,
                PlayerRankDetails = p.RankDetailsModel
                        .Select(r => new PlayerRankDetails
                        {
                            Leaves = r.Leaves,
                            Losses = r.Losses,
                            Points = r.Points,
                            PreviousRank = r.PreviousRank,
                            Rank = r.Rank,
                            RankName = r.RankedName,
                            Season = r.Season,
                            Tier = r.Tier,
                            Trend = r.Trend,
                            Wins = r.Wins,
                            CreatedOn = DateTime.UtcNow,
                            LastUpdatedOn = DateTime.Now,
                            IsActive = true
                        })
                        .ToList()
            };
        }
    }
}
