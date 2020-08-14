using Paladins.Common.ClientModels.General;
using Paladins.Common.Requests;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Clients
{
    public interface IGeneralClient
    {
        Task<List<GeneralChampionsClientModel>> GetClientChampionsAsync(GeneralBaseRequest request);
        Task<List<GeneralChampionsSkinsClientModel>> GetClientChampionSkinsAsync(ChampionSkinsRequest request);
        Task<List<GeneralItemsClientModel>> GetClientItemsAsync(GeneralBaseRequest request);
    }
}
