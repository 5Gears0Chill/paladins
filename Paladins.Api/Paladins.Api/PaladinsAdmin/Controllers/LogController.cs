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
        private readonly IApiUsageLogFactory _apiUsageLogFactory;

        public const string ControllerName = "Log";
        public LogController(IChangeLogFactory changeLogFactory, IExceptionLogFactory exceptionLogFactory, IApiUsageLogFactory apiUsageLogFactory)
        {
            _changeLogFactory = changeLogFactory;
            _exceptionLogFactory = exceptionLogFactory;
            _apiUsageLogFactory = apiUsageLogFactory;
        }

        public IActionResult Index()
        {
            return View(new LogAdminModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Log Overview" } });
        }

        public IActionResult ExceptionLog()
        {
            return View(new ExceptionLogAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Exception Log" } });
        }

        public IActionResult ChangeLog()
        {
            return View(new ChangeLogAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Change Log" } });
        }

        public IActionResult ApiUsageLog()
        {
            return View(new ApiUsageLogAdminSearchModel { PageTitleViewModel = new PageTitleViewModel { Heading = "Admin Dashboard", ActiveBreadCrumb = "Api Usage Log" } });
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

        public const string ApiUsageLogActionName = "SearchApiUsageLogs";
        [HttpPost]
        public async Task<JsonResult> SearchApiUsageLogs(ApiUsageLogAdminSearchModel searchModel)
        {
            var model = await _apiUsageLogFactory.MakeListModel(searchModel);
            return Json(model);
        }
    }
}
