using Paladins.Common.ClientModels.General;
using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Handlers;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class GeneralClient : BaseClient, IGeneralClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public GeneralClient(IRequestUrlBuilder requestUrlBuilder, IClientRetMessageHandler clientRetMessageHandler, IUnitOfWorkManager unitOfWorkManager)
            : base(clientRetMessageHandler, unitOfWorkManager)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<GeneralChampionsClientModel>> GetClientChampionsAsync(GeneralBaseRequest request)
        {
            var response = await SendRequestAsync<List<GeneralChampionsClientModel>>(_requestUrlBuilder.BuildGetChampionUrl(request.SessionId, request.LanguageId));
            await LogUsageStat(ActionNameConstants.GetChampions);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<GeneralChampionsSkinsClientModel>> GetClientChampionSkinsAsync(ChampionSkinsRequest request)
        {
            var response = await SendRequestAsync<List<GeneralChampionsSkinsClientModel>>(_requestUrlBuilder.BuildGetChampionSkinsUrl(request.SessionId, request.LanguageId, request.ChampionId));
            await LogUsageStat(ActionNameConstants.GetChampionSkins);
            return HandleRetMessageReponse(response);
        }
        public async Task<List<GeneralItemsClientModel>> GetClientItemsAsync(GeneralBaseRequest request)
        {
            var response = await SendRequestAsync<List<GeneralItemsClientModel>>(_requestUrlBuilder.BuildGetItemsUrl(request.SessionId, request.LanguageId));
            await LogUsageStat(ActionNameConstants.GetChampions);
            return HandleRetMessageReponse(response);
        }
    }
}
