using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Paladins.Common.Interfaces.Services;

namespace Paladins.Api.Controllers
{
    [Route("api/[controller]/[action]/")]
    [ApiController]
    public class SeedController : ControllerBase
    {
        private readonly ISeedService _seedService;
        private readonly ILogger _logger;

        public SeedController(ISeedService seedService, ILogger<SeedController> logger)
        {
            _seedService = seedService;
            _logger = logger;
        }


        [HttpPost]
        [ActionName(nameof(SeedDatabase))]
        [ProducesResponseType(500)]
        [ProducesResponseType(typeof(bool), 200)]
        public async Task<IActionResult> SeedDatabase()
        {
            var response = await _seedService.SeedAsync();
            return Ok(response);
        }


        [HttpPost]
        [ActionName(nameof(TestLogging))]
        public ActionResult TestLogging()
        {
            _logger.LogInformation("This is a test log");
            return Ok();
        }
    }
}
