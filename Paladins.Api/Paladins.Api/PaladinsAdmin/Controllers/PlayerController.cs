using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Factories.Interfaces;

namespace PaladinsAdmin.Controllers
{
    public class PlayerController : Controller
    {
        private readonly IPlayerModelFactory _playerModelFactory;
        public const string ControllerName = "Player";
        public PlayerController(IPlayerModelFactory playerModelFactory)
        {
            _playerModelFactory = playerModelFactory;
        }

        public IActionResult Index()
        {
            return View(new PlayerAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Current Players" } });
        }

        public const string PlayerActionName = "Players";

        [HttpPost]
        public async Task<JsonResult> Players(PlayerAdminSearchModel searchModel)
        {
            var model = await _playerModelFactory.MakeListModel(searchModel);
            return Json(model);
        }
    }
}
