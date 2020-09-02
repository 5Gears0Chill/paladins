using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class PlayerController : ControllerBase
    {
        private readonly IPlayerService _playerService;

        public PlayerController(IPlayerService playerService)
        {
            _playerService = playerService;
        }

        [HttpPost]
        [ActionName(nameof(GetPlayer))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<PlayerModel>), 200)]
        public async Task<IActionResult> GetPlayer([FromBody] PlayerBaseRequest request)
        {
            var response = await _playerService.GetPlayerAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetFriends))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerFriendsClientModel>>), 200)]
        public async Task<IActionResult> GetFriends([FromBody] PlayerBaseRequest request)
        {
            var response = await _playerService.GetPlayerFriendsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetChampionRanks))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerChampionRanksClientModel>>), 200)]
        public async Task<IActionResult> GetChampionRanks([FromBody] PlayerBaseRequest request)
        {
            var response = await _playerService.GetPlayerChampionRanksAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetMatchHistory))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsClientModel>>), 200)]
        public async Task<IActionResult> GetMatchHistory([FromBody] PlayerBaseRequest request)
        {
            var response = await _playerService.GetPlayerMatchHistoryAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerLoadouts))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerLoadoutsClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerLoadouts([FromBody] PlayerLoadoutsRequest request)
        {
            var response = await _playerService.GetPlayerLoadoutsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerStatus))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerStatusClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerStatus([FromBody] PlayerBaseRequest request)
        {
            var response = await _playerService.GetPlayerStatusAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerQueueStats))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerQueueStatsClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerQueueStats([FromBody] PlayerQueueStatsRequest request)
        {
            var response = await _playerService.GetPlayerQueueStatsAsync(request);
            return Ok(response);
        }
    }
}
