using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IPlayerRepository : IRepositoryCore
    {
        Task<DataResult<PlayerModel>> InsertNewPlayerAsync(PlayerModel model);
        Task<DataResult<PlayerModel>> UpdatePlayerAsync(PlayerModel model);
        Task<PlayerModel> GetPlayerByPaladinsPlayerId(int paladinsPlayerId);
        Task<PlayerModel> GetPlayerByPlayerName(string playerName);
        Task<IEnumerable<PlayerModel>> GetPlayers(PlayerAdminSearchModel request);
    }
}
