using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IMatchHistoryRepository : IRepositoryCore
    {
        Task<IEnumerable<PlayerMatchHistoryModel>> GetPlayerMatchHistories(PlayerModel playerModel);
        Task<DataListResult<PlayerMatchHistoryModel>> UpdatePlayerMatchHistoryAsync(List<PlayerMatchHistoryModel> lists, PlayerModel player);
        Task<DataListResult<PlayerMatchHistoryModel>> InsertPlayerMatchHistoryAsync(List<PlayerMatchHistoryModel> model, PlayerModel player);
        Task<PagedResponse<MatchHistoryModel>> GetPagedMatchHistoriesAsync(PlayerPagedRequest request);
    }
}
