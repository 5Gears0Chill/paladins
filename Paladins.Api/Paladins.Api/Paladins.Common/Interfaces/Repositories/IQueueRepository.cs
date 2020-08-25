using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IQueueRepository : IRepositoryCore
    {
        Task<NonDataResult> InsertBaseQueuesAsync();
    }
}
