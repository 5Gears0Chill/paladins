using Paladins.Common.Requests.Admin;

namespace PaladinsAdmin.Models.Log
{
    public class LogAdminModel
    {
        public ChangeLogListModel ChangeLogListModel { get; set; }
        public ExceptionLogListModel ExceptionLogListModel { get; set; }
        public PageTitleViewModel PageTitleViewModel { get; set; }
    }
}
