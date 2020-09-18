using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;

namespace Paladins.Api.Controllers
{
    /// <summary>
    /// This controller holds the requests needed to initialise the mobile application
    /// </summary>
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class InitialController : ControllerBase
    {

        private readonly IInitialService _initialService;

        public InitialController(IInitialService initialService)
        {
            _initialService = initialService;
        }

        [HttpPost]
        [ActionName(nameof(GetChampions))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<ChampionModel>), 200)]
        public async Task<IActionResult> GetChampions([FromBody] PagedRequest request)
        {
            var response = await _initialService.GetChampionsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetItems))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(bool), 200)]
        public async Task<IActionResult> GetItems()
        {
            return Ok();
        }

        [HttpPost]
        [ActionName(nameof(GetQueues))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(bool), 200)]
        public async Task<IActionResult> GetQueues()
        {
            return Ok();
        }

        [HttpPost]
        [ActionName(nameof(GetTiers))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(bool), 200)]
        public async Task<IActionResult> GetTiers()
        {
            return Ok();
        }

        [HttpPost]
        [ActionName(nameof(GetSkins))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(bool), 200)]
        public async Task<IActionResult> GetSkins()
        {
            return Ok();
        }
    }
}
