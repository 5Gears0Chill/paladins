using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IPlayerAdminService
    {
        /// <summary>
        /// Calls the Db to retrieve a list of Players ordered by desc
        /// </summary>
        /// <param name="request">Allows for searching with player name</param>
        /// <returns></returns>
        Task<IEnumerable<PlayerModel>> GetPlayerAsync(PlayerAdminSearchModel request);
    }
}
