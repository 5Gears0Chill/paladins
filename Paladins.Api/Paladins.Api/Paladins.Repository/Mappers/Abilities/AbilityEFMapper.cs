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
                Name = a.Name,
                Description = a.Description,
                Url = a.Url.AbsoluteUri,
            };
        }
    }
}
