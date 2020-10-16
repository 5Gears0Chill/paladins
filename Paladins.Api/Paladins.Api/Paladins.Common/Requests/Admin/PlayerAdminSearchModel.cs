using Paladins.Common.Models.Admin;

namespace Paladins.Common.Requests.Admin
{
    public class PlayerAdminSearchModel : BaseSearchModel
    {
        public string PlayerName { get; set; }
        public PageTitleViewModel PageTitleViewModel { get; set; }
    }
}
