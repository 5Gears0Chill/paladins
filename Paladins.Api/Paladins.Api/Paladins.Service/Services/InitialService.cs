using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Services
{
    public class InitialService : IInitialService
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public InitialService(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;
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
        public async Task GetQueuesAsync()
        {

        }
        public async Task GetTiersAsync()
        {

        }

        public async Task GetSkinsAsync()
        {

        }
    }
}
