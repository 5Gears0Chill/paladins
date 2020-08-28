using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;

namespace Paladins.Repository.Mappers.Abilities
{
    public class AbilityEFMapper : IMapper<AbilityModel, Ability>
    {
        public Ability Map(AbilityModel a)
        {
            return new Ability
            {
                PabilityId = a.PaladinsAbilityId,
                Name = a.Summary,
                Description = a.Description,
                Url = a.Url.AbsoluteUri,
            };
        }
    }
}
