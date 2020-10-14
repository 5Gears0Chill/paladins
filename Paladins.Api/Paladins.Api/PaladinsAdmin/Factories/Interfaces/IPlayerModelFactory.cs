using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Models.Player;
using System.Threading.Tasks;

namespace PaladinsAdmin.Factories.Interfaces
{
    public interface IPlayerModelFactory
    {
        Task<PlayerListModel> MakeListModel(PlayerAdminSearchModel searchModel);
    }
}
