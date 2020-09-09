using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;

namespace Paladins.Repository.Mappers.Champions
{
    public class ChampionStatsEFMapper : IMapper<PlayerChampionStatsModel, PlayerChampionStats>
    {
        public PlayerChampionStats Map(PlayerChampionStatsModel c)
        {
            return new PlayerChampionStats
            {
                Assists = c.Assists,
                CreatedOn = c.CreatedOn,
                Deaths = c.Deaths,
                Id = c.Id,
                Kills = c.Kills,
                LastUpdatedOn = c.LastUpdatedOn,
                Losses = c.Losses,
                PchampionId = c.PaladinsChampionId,
                PlayerId = c.PlayerId,
                Rank = c.Rank,
                Wins = c.Wins
            };
        }
    }
}
