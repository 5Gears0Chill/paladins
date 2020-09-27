using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
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
        Task<PagedResponse<ChampionModel>> GetChampionsAsync(PagedRequest request);
        Task<PagedResponse<PlayerChampionStatsModel>> GetPagedPlayerChampionStats(PlayerPagedRequest request, PlayerModel model);
    }
}
