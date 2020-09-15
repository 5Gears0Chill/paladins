using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class PlayerController : ControllerBase
    {
        private readonly IPlayerService _playerService;
        private readonly IControllerRequestResolver _resolver;
        public PlayerController(IPlayerService playerService, 
            IControllerRequestResolver resolver)
        {
            _playerService = playerService;
            _resolver = resolver;
        }

        [HttpPost]
        [ActionName(nameof(GetPlayer))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<PlayerModel>), 200)]
        public async Task<IActionResult> GetPlayer([FromBody] PlayerControllerRequest request)
        {
            var response = await _playerService
                .GetPlayerAsync(_resolver.CreateBasePlayerRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetFriends))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<PlayerModel>), 200)]
        public async Task<IActionResult> GetFriends([FromBody] PlayerControllerRequest request)
        {
            var response = await _playerService
                .GetPlayerFriendsAsync(_resolver.CreateBasePlayerRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetChampionRanks))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerChampionRanksClientModel>>), 200)]
        public async Task<IActionResult> GetChampionRanks([FromBody] PlayerControllerRequest request)
        {
            var response = await _playerService
                .GetPlayerChampionRanksAsync(_resolver.CreateBasePlayerRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetMatchHistory))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsClientModel>>), 200)]
        public async Task<IActionResult> GetMatchHistory([FromBody] PlayerControllerRequest request)
        {
            var response = await _playerService
                .GetPlayerMatchHistoryAsync(_resolver.CreateBasePlayerRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerLoadouts))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerLoadoutsClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerLoadouts([FromBody] PlayerControllerLoadoutRequest request)
        {
            var response = await _playerService
                .GetPlayerLoadoutsAsync(_resolver.CreatePlayerLoadoutsRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerStatus))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerStatusClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerStatus([FromBody] PlayerControllerRequest request)
        {
            var response = await _playerService
                .GetPlayerStatusAsync(_resolver.CreateBasePlayerRequest(request));
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerQueueStats))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<PlayerQueueStatsClientModel>>), 200)]
        public async Task<IActionResult> GetPlayerQueueStats([FromBody] PlayerControllerQueueStatsRequest request)
        {
            var response = await _playerService
                .GetPlayerQueueStatsAsync(_resolver.CreatePlayerQueueStatsRequest(request));
            return Ok(response);
        }
    }
}
