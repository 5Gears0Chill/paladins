using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Models.Log;
using System.Threading.Tasks;

namespace PaladinsAdmin.Factories.Interfaces
{
    public interface IApiUsageLogFactory
    {
        Task<ApiUsageLogListModel> MakeListModel(ApiUsageLogAdminSearchModel searchModel);
    }
}
