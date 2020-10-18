using Microsoft.AspNetCore.Mvc;
using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Factories.Interfaces;
using PaladinsAdmin.Models.Log;
using System.Threading.Tasks;

namespace PaladinsAdmin.Controllers
{
    public class LogController : Controller
    {
        private readonly IChangeLogFactory _changeLogFactory;
        private readonly IExceptionLogFactory _exceptionLogFactory;

        public const string ControllerName = "Log";
        public LogController(IChangeLogFactory changeLogFactory, IExceptionLogFactory exceptionLogFactory)
        {
            _changeLogFactory = changeLogFactory;
            _exceptionLogFactory = exceptionLogFactory;
        }

        public IActionResult Index()
        {
            return View(new LogAdminModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Log Overview" } });
        }

        public IActionResult ExceptionLog()
        {
            return View(new ExceptionLogAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Exception log" } });
        }

        public IActionResult ChangeLog()
        {
            return View(new ChangeLogAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Change log" } });
        }

        public const string ExeptionLogActionName = "SearchExceptionLogs";
        [HttpPost]
        public async Task<JsonResult> SearchExceptionLogs(ExceptionLogAdminSearchModel searchModel)
        {
            var model = await _exceptionLogFactory.MakeListModel(searchModel);
            return Json(model);
        }

        public const string ChangeLogActionName = "SearchChangeLogs";
        [HttpPost]
        public async Task<JsonResult> SearchChangeLogs(ChangeLogAdminSearchModel searchModel)
        {
            var model = await _changeLogFactory.MakeListModel(searchModel);
            return Json(model);
        }
    }
}
