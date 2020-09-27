using Paladins.Common.ClientModels.General;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IGeneralService
    {
        /// <summary>
        /// Get a paged response of champions 
        /// </summary>
        /// <param name="request">Generic paged request</param>
        /// <returns>Detailed response of champions</returns>
        Task<PagedResponse<ChampionModel>> GetChampionsAsync(PagedRequest request);
        /// <summary>
        /// Fetches a paged item request based on a specific champion. 
        /// Passing an item with champion id = 0 returns purchasable items 
        /// Passing an item with champion id = -1 returns no items
        /// </summary>
        /// <param name="request"></param>
        /// <returns>Detailed response of items</returns>
        Task<PagedResponse<ItemModel>> GetItemsAsync(ItemPagedRequest request);
        /// <summary>
        /// Currently requests champion skins from the Paladins API
        /// </summary>
        /// <param name="request">requires a session Id and a champion Id</param>
        /// <returns>list of champion skins</returns>
        Task<Response<List<GeneralChampionsSkinsClientModel>>> GetChampionSkinsAsync(ChampionSkinsRequest request);
    }
}
