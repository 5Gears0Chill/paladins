using Paladins.Common.ClientModels.General;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IGeneralService
    {
        Task<Response<List<GeneralChampionsClientModel>>> GetChampionsAsync(GeneralBaseRequest request);
        Task<Response<List<GeneralChampionsSkinsClientModel>>> GetChampionSkinsAsync(ChampionSkinsRequest request);
        Task<Response<List<GeneralItemsClientModel>>> GetItemsAsync(GeneralBaseRequest request);
    }
}
