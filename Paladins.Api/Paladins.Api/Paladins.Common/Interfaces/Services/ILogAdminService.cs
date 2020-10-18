using Paladins.Common.Interfaces.Definitions;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface ILogAdminService : IAdminService
    {
        Task<IEnumerable<ChangeLogModel>> FetchChangeLogAsync(ChangeLogAdminSearchModel model);
        Task<IEnumerable<ExceptionLogModel>> FetchExceptionLogAsync(ExceptionLogAdminSearchModel model);
    }
}
