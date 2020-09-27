using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class GeneralService: IGeneralService
    {
        private readonly IGeneralClient _generalClient;
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public GeneralService(IGeneralClient generalClient, IUnitOfWorkManager unitOfWorkManager)
        {
            _generalClient = generalClient;
            _unitOfWorkManager = unitOfWorkManager;
        }

        public async Task<Response<List<GeneralChampionsSkinsClientModel>>> GetChampionSkinsAsync(ChampionSkinsRequest request)
        {
            var response = await _generalClient.GetClientChampionSkinsAsync(request);

            return new Response<List<GeneralChampionsSkinsClientModel>>() { Data = response };
        }

        public async Task<PagedResponse<ChampionModel>> GetChampionsAsync(PagedRequest request)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
                <IChampionRepository, PagedResponse<ChampionModel>>
                (u => u.GetChampionsAsync(request));
        }
        public async Task<PagedResponse<ItemModel>> GetItemsAsync(ItemPagedRequest request)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
                <IItemRepository, PagedResponse<ItemModel>>
                (u => u.getItemsAsync(request));
        }
    }
}
