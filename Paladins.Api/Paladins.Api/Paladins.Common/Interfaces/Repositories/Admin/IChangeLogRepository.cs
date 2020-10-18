using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories.Admin
{
    public interface IChangeLogRepository : IRepositoryCore
    {
        Task<IEnumerable<ChangeLogModel>> GetChangeLogAsync(ChangeLogAdminSearchModel model);
    }
}
