using Paladins.Common.ClientModels;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Handlers;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class SessionClient : BaseClient, ISessionClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public SessionClient(IRequestUrlBuilder requestUrlBuilder, IClientRetMessageHandler clientRetMessageHandler)
            : base(clientRetMessageHandler)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<SessionClientModel> GetClientSessionAsync() 
            => await SendRequestAsync<SessionClientModel>(_requestUrlBuilder.BuildSessionUrl());

        public async Task<List<UsageStatisticsClientModel>> GetClientUsageStatistics(string sessionId)
            => await SendRequestAsync<List<UsageStatisticsClientModel>>(_requestUrlBuilder.BuildUsageStatisticsUrl(sessionId));
    }
}
