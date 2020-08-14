using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class GeneralClient : BaseClient, IGeneralClient
    {
        private readonly IRequestUrlBuilder _requestUrlBuilder;
        public GeneralClient(IRequestUrlBuilder requestUrlBuilder)
        {
            _requestUrlBuilder = requestUrlBuilder;
        }

        public async Task<List<GeneralChampionsClientModel>> GetClientChampionsAsync(GeneralBaseRequest request)
            => await SendRequestAsync<List<GeneralChampionsClientModel>>(_requestUrlBuilder.BuildGetChampionUrl(request.SessionId, request.LanguageId));
        public async Task<List<GeneralChampionsSkinsClientModel>> GetClientChampionSkinsAsync(ChampionSkinsRequest request)
            => await SendRequestAsync<List<GeneralChampionsSkinsClientModel>>(_requestUrlBuilder.BuildGetChampionSkinsUrl(request.SessionId, request.LanguageId, request.ChampionId));
         public async Task<List<GeneralItemsClientModel>> GetClientItemsAsync(GeneralBaseRequest request)
            => await SendRequestAsync<List<GeneralItemsClientModel>>(_requestUrlBuilder.BuildGetItemsUrl(request.SessionId, request.LanguageId));

    }
}
