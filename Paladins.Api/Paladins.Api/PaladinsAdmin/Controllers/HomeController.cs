using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Factories.Interfaces;
using PaladinsAdmin.Models;

namespace PaladinsAdmin.Controllers
{
    public class HomeController : Controller
    {
        public const string ControllerName = "Home";

        private readonly ILogger<HomeController> _logger;
        private readonly IPlayerModelFactory _playerModelFactory;
        public HomeController(ILogger<HomeController> logger, IPlayerModelFactory playerModelFactory)
        {
            _logger = logger;
            _playerModelFactory = playerModelFactory;
        }

        public IActionResult Index()
        {
            return View(new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Dashboard" });
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
