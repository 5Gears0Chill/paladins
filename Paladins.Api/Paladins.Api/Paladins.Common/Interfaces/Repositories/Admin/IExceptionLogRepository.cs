using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories.Admin
{
    public interface IExceptionLogRepository : IRepositoryCore
    {
        Task<bool> InsertLogAsync(ExceptionLogModel model);
        Task<IEnumerable<ExceptionLogModel>> GetExceptionLogAsync(ExceptionLogAdminSearchModel model);
    }
}
