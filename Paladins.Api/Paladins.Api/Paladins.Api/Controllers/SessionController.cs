using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.ClientModels;
using Paladins.Common.Dto;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Requests;
using Paladins.Common.Responses;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class SessionController : ControllerBase
    {
        private readonly ISessionService _sessionService;
        public SessionController(ISessionService sessionService)
        {
            _sessionService = sessionService;
        }

        [HttpGet]
        [ActionName(nameof(GetNewSession))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<SessionClientDTO>), 200)]
        public async Task<IActionResult> GetNewSession()
        {
            var response = await _sessionService.GetClientSessionAsync();
            return Ok(response);
        }

        [HttpPost]
        [ActionName(nameof(GetUsageStatistics))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(Response<List<UsageStatisticsClientModel>>), 200)]
        public async Task<IActionResult> GetUsageStatistics([FromBody] BaseRequest request)
        {
            var response = await _sessionService.GetUsageStatisticsAsync(request);
            return Ok(response);
        }
    }
}
