using Paladins.Common.Models.Admin;
using System;

namespace Paladins.Common.Requests.Admin
{
    public class ApiUsageLogAdminSearchModel : BaseSearchModel
    {
        public DateTime FromSearchDate { get; set; }
        public DateTime ToSearchDate { get; set; }
        public PageTitleViewModel PageTitleViewModel { get; set; }
    }
}
