using Paladins.Common.DataAccess.Models;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface ITierRepository
    {
        Task<NonDataResult> InsertBaseTiersAsync();
    }
}
