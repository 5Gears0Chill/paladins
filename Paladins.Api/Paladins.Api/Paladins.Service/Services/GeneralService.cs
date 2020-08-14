using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class GeneralService: IGeneralService
    {
        private readonly IGeneralClient _generalClient;
        public GeneralService(IGeneralClient generalClient)
        {
            _generalClient = generalClient;
        }

        public async Task<Response<List<GeneralChampionsClientModel>>> GetChampionsAsync(GeneralBaseRequest request)
        {
            var response = await _generalClient.GetClientChampionsAsync(request);

            return new Response<List<GeneralChampionsClientModel>>() { Data = response };
        }

        public async Task<Response<List<GeneralChampionsSkinsClientModel>>> GetChampionSkinsAsync(ChampionSkinsRequest request)
        {
            var response = await _generalClient.GetClientChampionSkinsAsync(request);

            return new Response<List<GeneralChampionsSkinsClientModel>>() { Data = response };
        }

        public async Task<Response<List<GeneralItemsClientModel>>> GetItemsAsync(GeneralBaseRequest request)
        {
            var response = await _generalClient.GetClientItemsAsync(request);

            return new Response<List<GeneralItemsClientModel>>() { Data = response };
        }
    }
}
