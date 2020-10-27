using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels.Match;
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
    public class MatchController : ControllerBase
    {
        private readonly IMatchService _matchService;
        private readonly IMatchMobileService _matchMobileService;
        private readonly IControllerRequestResolver _resolver;

        public MatchController(IMatchService matchService, 
            IControllerRequestResolver resolver, 
            IMatchMobileService matchMobileService)
        {
            _matchService = matchService;
            _resolver = resolver;
            _matchMobileService = matchMobileService;
        }

        [HttpPost]
        [ActionName(nameof(GetMatchDetails))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsModel>>), 200)]
        public async Task<IActionResult> GetMatchDetails([FromBody] MatchControllerRequest request)
        {
            var response = await _matchService.GetMatchDetailsAsync(_resolver.CreateBaseMatchRequest(request));
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

        [HttpPost]
        [ActionName(nameof(GetNonLinkedMatchDetails))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<MatchDetailsModel>>), 200)]
        public async Task<IActionResult> GetNonLinkedMatchDetails(MatchNonLinkedRequest request)
        {
           var response =  await _matchMobileService.GetMatchDetailsAsync(_resolver.CreateBaseMatchRequest(request));
            return Ok(response);
        }
    }
}
