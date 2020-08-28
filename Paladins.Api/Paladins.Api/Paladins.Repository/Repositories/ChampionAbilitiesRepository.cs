using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class ChampionAbilitiesRepository : Repository<PaladinsDbContext>, IChampionAbilitiesRepository
    {
        public ChampionAbilitiesRepository(IAuditManager auditManager)
            :base(auditManager)
        {
        }

        public async Task<NonDataResult> InsertLinkingRelationships(IEnumerable<ChampionModel> champions)
        {
            var linkageModels = champions.SelectMany(x => x.ChampionLinkageModels);

            var abilities = await Context.Ability.Where(a => linkageModels.Select(x => x.PaladinsAbilityId).Contains(a.PabilityId))
                .Select(a => new {a.Id, a.PabilityId } ).ToListAsync();
            var champs = await Context.Champion.Where(c => champions.Select(x => x.PaladinsChampionId).Contains(c.PchampionId))
                .Select(c => new {c.Id, c.PchampionId }).ToListAsync();

            List<ChampionAbilities> championAbilities = new List<ChampionAbilities>();
            foreach(var linkedModel in linkageModels)
            {
                var ability = abilities.Where(x => x.PabilityId == linkedModel.PaladinsAbilityId).Select(x => new 
                {
                    AbilityId = x.Id,
                    linkedModel.PaladinsAbilityId,
                    linkedModel.PaladinsChampionId,
                }).FirstOrDefault();

                var champ = champs.Where(x => x.PchampionId == linkedModel.PaladinsChampionId).Select(x => new 
                {
                    ChampionId = x.Id,
                    linkedModel.PaladinsAbilityId,
                    linkedModel.PaladinsChampionId,
                }).FirstOrDefault();

                var link = new ChampionAbilities
                {
                    ChampionId = champ.ChampionId,
                    AbilityId = ability.AbilityId,
                };
                championAbilities.Add(link);
            }

            return await InsertListAsync(championAbilities);
        }
    }
}
