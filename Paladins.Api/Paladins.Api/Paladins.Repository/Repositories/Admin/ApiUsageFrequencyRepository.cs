using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities.Admin;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories.Admin
{
    public class ApiUsageFrequencyRepository : Repository<PaladinsDbContext>, IApiUsageFrequencyRepository
    {
        public ApiUsageFrequencyRepository(IAuditManager auditManager)
           : base(auditManager) { }

        public async Task<bool> InsertUsage(int actionEndPointId)
        {
            var response = await SaveAsync(new ApiUsageFrequency
            {
                ActionEndPointId = actionEndPointId
            });
            return response.IsSuccessful;
        }

        public async Task<ActionEndPointModel> GetActionAsync(string actionName)
        {
            return await Context.ActionEndPoint
                .Where(x => x.ActionName.Contains(actionName))
                .Select(x => new ActionEndPointModel 
                { 
                    ActionName = x.ActionName, 
                    Id = x.Id 
                }).FirstOrDefaultAsync();
        }
    }
}
