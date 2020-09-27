using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class PlayerController : ControllerBase
    {
        private readonly IPlayerService _playerService;
        private readonly IPlayerMobileService _playerMobileService;
        private readonly IControllerRequestResolver _resolver;

        public PlayerController(IPlayerService playerService, 
            IPlayerMobileService playerMobileService, 
            IControllerRequestResolver resolver)
        {
            _playerService = playerService;
            _playerMobileService = playerMobileService;
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
        [ActionName(nameof(GetPlayerLoadouts))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<PlayerLoadoutModel>), 200)]
        public async Task<IActionResult> GetPlayerLoadouts([FromBody] PlayerPagedRequest request)
        {
            var model = await _playerService
                .GetPlayerLoadoutsAsync(_resolver.CreatePlayerLoadoutsRequest(request));

            var response = await _playerMobileService.GetPagedPlayerLoadoutsAsync(request, model.Data);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerFriends))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<FriendModel>), 200)]
        public async Task<IActionResult> GetPlayerFriends([FromBody] PlayerPagedRequest request)
        {
            await _playerService
                .GetPlayerFriendsAsync(_resolver.CreateBasePlayerRequest(request));
            var response = await _playerMobileService.GetPagedPlayerFriendsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerChampionStats))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<PlayerChampionStatsModel>), 200)]
        public async Task<IActionResult> GetPlayerChampionStats([FromBody] PlayerPagedRequest request)
        {
            var model = await _playerService
                .GetPlayerChampionRanksAsync(_resolver.CreateBasePlayerRequest(request));
            var response = await _playerMobileService.GetPagedPlayerChampionStatsAsync(request, model.Data);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetPlayerMatchHistory))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(PagedResponse<MatchHistoryModel>), 200)]
        public async Task<IActionResult> GetPlayerMatchHistory([FromBody] PlayerPagedRequest request)
        {
            await _playerService
                .GetPlayerMatchHistoryAsync(_resolver.CreateBasePlayerRequest(request));
            var response = await _playerMobileService.GetPagedPlayerMatchHistoryAsync(request);
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
