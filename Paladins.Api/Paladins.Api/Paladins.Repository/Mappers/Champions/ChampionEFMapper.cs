using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;

namespace Paladins.Repository.Mappers.Champions
{
    public class ChampionEFMapper : IMapper<ChampionModel, Champion>
    {
        public Champion Map(ChampionModel c)
        {
            return new Champion
            {
                Health = c.Health,
                IsLatestChampion = c.LatestChampion,
                Lore = c.Lore,
                PchampionId = c.PaladinsChampionId,
                Role = c.Role,
                Speed = c.Speed,
                Title = c.Title,
                Name = c.Name,
                Url = c.ChampionIconUrl.AbsoluteUri,
            };
        }
    }
}
