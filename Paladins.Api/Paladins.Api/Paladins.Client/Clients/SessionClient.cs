using Paladins.Common.ClientModels;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Handlers;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class SessionClient : BaseClient, ISessionClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public SessionClient(IRequestUrlBuilder requestUrlBuilder, IClientRetMessageHandler clientRetMessageHandler, IUnitOfWorkManager unitOfWorkManager)
            : base(clientRetMessageHandler, unitOfWorkManager)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<SessionClientModel> GetClientSessionAsync()
        {
            var response = await SendRequestAsync<SessionClientModel>(_requestUrlBuilder.BuildSessionUrl());
            await LogUsageStat(ActionNameConstants.GetSession);
            return response;
        } 
        public async Task<List<UsageStatisticsClientModel>> GetClientUsageStatistics(string sessionId)
        {
            var response = await SendRequestAsync<List<UsageStatisticsClientModel>>(_requestUrlBuilder.BuildUsageStatisticsUrl(sessionId));
            await LogUsageStat(ActionNameConstants.GetUsageStats);
            return response;
        }
          
    }
}
