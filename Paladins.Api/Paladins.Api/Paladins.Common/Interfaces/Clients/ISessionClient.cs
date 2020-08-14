using Paladins.Common.ClientModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Clients
{
    public interface ISessionClient
    {
        Task<SessionClientModel> GetClientSessionAsync();
        Task<List<UsageStatisticsClientModel>> GetClientUsageStatistics(string sessionId);
    }
}
