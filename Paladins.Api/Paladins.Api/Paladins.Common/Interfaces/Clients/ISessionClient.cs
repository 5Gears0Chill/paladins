using Paladins.Common.ClientModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Clients
{
    public interface ISessionClient
    {
        /// <summary>
        /// Creates a new Session with the paladins API
        /// </summary>
        /// <returns>Session Client Model </returns>
        Task<SessionClientModel> GetClientSessionAsync();
        Task<List<UsageStatisticsClientModel>> GetClientUsageStatistics(string sessionId);
    }
}
