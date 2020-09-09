using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IChampionRepository : IRepositoryCore
    {
        Task<NonDataResult> InsertChampionsAsync(IEnumerable<ChampionModel> champions);
        Task<DataListResult<PlayerChampionStatsModel>> InsertPlayerChampionStatsAsync(List<PlayerChampionStatsModel> model, PlayerModel player);
        Task<DataListResult<PlayerChampionStatsModel>> UpdatePlayerChampionStatsAsync(List<PlayerChampionStatsModel> model, PlayerModel player);
        Task<IEnumerable<PlayerChampionStatsModel>> GetPlayerChampionStatsAsync(PlayerModel player);
    }
}
