using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories.Admin
{
    public class ExceptionLogRepository : Repository<PaladinsDbContext>, IExceptionLogRepository
    {
        public ExceptionLogRepository(IAuditManager auditManager)
          : base(auditManager) { }

        public async Task<bool> InsertLogAsync(ExceptionLogModel model)
        {
            try
            {
                var response = await SaveAsync(new ExceptionLog
                {
                    ErrorCode = model.ErrorCode,
                    ErrorMessage = model.ErrorMessage,
                    ErrorType = model.ErrorType,
                    EventDate = DateTime.Now,
                    IsActive = true,
                    StackTrace = model.StackTrace,
                });
                return response.IsSuccessful;
            }
            catch (Exception) 
            {
                return false;
            }
        }

        public async Task<IEnumerable<ExceptionLogModel>> GetExceptionLogAsync(ExceptionLogAdminSearchModel model)
        {
            return await Context.ExceptionLog
              .OrderByDescending(x => x.Id)
              .Select(x => new ExceptionLogModel
              {
                  ErrorCode = x.ErrorCode,
                  ErrorMessage = x.ErrorMessage,
                  ErrorType = x.ErrorType,
                  EventDate = x.EventDate,
                  StackTrace = x.StackTrace
              }).ToListAsync();
        }
    }
}
