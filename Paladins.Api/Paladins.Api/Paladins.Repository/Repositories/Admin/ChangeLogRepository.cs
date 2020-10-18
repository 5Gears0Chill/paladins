using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using Paladins.Repository.DbContexts;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories.Admin
{
    public class ChangeLogRepository : Repository<PaladinsDbContext>, IChangeLogRepository
    {
        public ChangeLogRepository(IAuditManager auditManager)
          : base(auditManager) { }
        
        public async Task<IEnumerable<ChangeLogModel>> GetChangeLogAsync(ChangeLogAdminSearchModel model)
        {
            return await Context.ChangeLog
               .OrderByDescending(x => x.Id)
               .Select(x => new ChangeLogModel 
               {
                   DatabaseName = x.DatabaseName,
                   EventDate = x.EventDate,
                   EventType = x.EventType,
                   LoginName = x.LoginName,
                   ObjectName = x.ObjectName,
                   ObjectType = x.ObjectType,
                   SqlCommand = x.SqlCommand
               }).ToListAsync();
        }
    }
}
