using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface ILoadoutRepository: IRepositoryCore
    {
        Task<IEnumerable<PlayerLoadoutModel>> GetPlayerLoadoutAsync(PlayerModel model);
        Task<DataListResult<PlayerLoadoutModel>> InsertPlayerLoadoutAsync(List<PlayerLoadoutModel> model);
        Task<DataListResult<PlayerLoadoutModel>> UpdatePlayerLoadoutAsync(List<PlayerLoadoutModel> model);
        Task<PagedResponse<PlayerLoadoutModel>> GetPagedLoadoutsAsync(PlayerPagedRequest request, PlayerModel model);
    }
}
