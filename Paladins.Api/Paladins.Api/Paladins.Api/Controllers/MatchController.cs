using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class MatchController : ControllerBase
    {
        private readonly IMatchService _matchService;

        public MatchController(IMatchService matchService)
        {
            _matchService = matchService;
        }

        [HttpPost]
        [ActionName(nameof(GetMatchDetails))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsClientModel>>), 200)]
        public async Task<IActionResult> GetMatchDetails([FromBody] MatchBaseRequest request)
        {
            var response = await _matchService.GetMatchDetailsAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetMatchDetailsBatch))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsClientModel>>), 200)]
        public async Task<IActionResult> GetMatchDetailsBatch([FromBody] MatchBatchRequest request)
        {
            var response = await _matchService.GetMatchDetailsBatchAsync(request);
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetMatchIdsByQueue))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchIdsClientModel>>), 200)]
        public async Task<IActionResult> GetMatchIdsByQueue([FromBody] MatchIdsByQueueRequest request)
        {
            var response = await _matchService.GetMatchIdsByQueueAsync(request);
            return Ok(response);
        }
    }
}
