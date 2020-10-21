using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
using Paladins.Common.Requests.Admin;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities.Admin;
using System.Collections.Generic;
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

        public async Task<IEnumerable<ApiUsageModel>> GetApiUsageAsync(ApiUsageLogAdminSearchModel model)
        {
            return await Context.ApiUsageFrequency
                .Include(x => x.ActionEndPoint)
                .ConditionalBetween(
                () => model.FromSearchDate.IsNotDefualtDate(),
                () => model.ToSearchDate.IsNotDefualtDate(),
                x => x.CreatedOn
                        .IsBetween(model.FromSearchDate, model.ToSearchDate))
                .Select(x => new ApiUsageModel
                {
                    Id = x.Id,
                    ActionName = x.ActionEndPoint.ActionName,
                    Category = x.ActionEndPoint.Category,
                    EventDate = x.CreatedOn
                })
                .OrderByDescending(x => x.Id)
                .ToListAsync();
        }
    }
}
