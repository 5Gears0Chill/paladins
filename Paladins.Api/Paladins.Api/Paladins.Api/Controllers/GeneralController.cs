using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using System.Threading.Tasks;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class GeneralController : ControllerBase
    {
        private readonly IGeneralService _generalService;
        public GeneralController(IGeneralService generalService)
        {
            _generalService = generalService;
        }

        [HttpPost]
        [ActionName(nameof(GetChampions))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<ChampionModel>), 200)]
        public async Task<IActionResult> GetChampions([FromBody] PagedRequest request)
        {
            var response = await _generalService.GetChampionsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetItems))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<ItemModel>), 200)]
        public async Task<IActionResult> GetItems([FromBody] ItemPagedRequest request)
        {
            var response = await _generalService.GetItemsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetChampionSkins))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<GeneralChampionsClientModel>>), 200)]
        public async Task<IActionResult> GetChampionSkins([FromBody] ChampionSkinsRequest request)
        {
            var response = await _generalService.GetChampionSkinsAsync(request);
            return Ok(response);
        }
    }
}
