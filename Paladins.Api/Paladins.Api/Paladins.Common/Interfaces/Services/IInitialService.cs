using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IInitialService
    {
        Task<PagedResponse<ChampionModel>> GetChampionsAsync(PagedRequest request);
        Task<PagedResponse<ItemModel>> GetItemsAsync(ItemPagedRequest request);
    }
}
