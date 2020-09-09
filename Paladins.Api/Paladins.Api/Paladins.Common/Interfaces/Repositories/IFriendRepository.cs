using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IFriendRepository: IRepositoryCore
    {
        Task<DataListResult<FriendModel>> InsertFriendsAsync(List<FriendModel> model, PlayerModel player);
        Task<IEnumerable<FriendModel>> GetFriendsAsync(PlayerModel player);
        Task<DataListResult<FriendModel>> UpdateFriendsAsync(List<FriendModel> model, PlayerModel player);
    }
}
