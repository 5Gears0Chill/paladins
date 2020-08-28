using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Common.Mappers
{
    public class ChampionMapper : IMapper<GeneralChampionsClientModel, ChampionModel>
    {
        public ChampionModel Map(GeneralChampionsClientModel c)
        {
            var championModel =  new ChampionModel
            {
                PaladinsChampionId = Convert.ToInt32(c.Id),
                Health = Convert.ToInt32(c.Health),
                Speed = Convert.ToInt32(c.Speed),
                Name = c.Name,
                Title = c.Title,
                Lore = c.Lore,
                Role = c.Roles,
                LatestChampion = c.LatestChampion,
                ChampionIconUrl = c.ChampionIconUrl,
                Abilities = new List<AbilityModel>(5) 
                    {
                        new AbilityModel
                        {
                            PaladinsAbilityId = Convert.ToInt32(c.AbilityId1),
                            Description = c.AbilityDescription1,
                            Summary = c.Ability1,
                            Url = c.ChampionAbility1Url,
                        },
                        new AbilityModel
                        {
                            PaladinsAbilityId = Convert.ToInt32(c.AbilityId2),
                            Description = c.AbilityDescription2,
                            Summary = c.Ability2,
                            Url = c.ChampionAbility2Url,
                        },
                        new AbilityModel
                        {
                            PaladinsAbilityId = Convert.ToInt32(c.AbilityId3),
                            Description = c.AbilityDescription3,
                            Summary = c.Ability3,
                            Url = c.ChampionAbility3Url,
                        },
                        new AbilityModel
                        {
                            PaladinsAbilityId = Convert.ToInt32(c.AbilityId4),
                            Description = c.AbilityDescription4,
                            Summary = c.Ability4,
                            Url = c.ChampionAbility4Url,
                        },
                        new AbilityModel
                        {
                            PaladinsAbilityId = Convert.ToInt32(c.AbilityId5),
                            Description = c.AbilityDescription5,
                            Summary = c.Ability5,
                            Url = c.ChampionAbility5Url,
                        }
                    }
            };
            return GenerateLinkageModels(championModel);
        }

        private ChampionModel GenerateLinkageModels(ChampionModel championModel)
        {

            var abilityIds = championModel.Abilities.Select(x => x.PaladinsAbilityId).ToList();
            championModel.ChampionLinkageModels.AddRange(from id in abilityIds
                           select new ChampionLinkageModel
                           {
                               PaladinsChampionId = championModel.PaladinsChampionId,
                               PaladinsAbilityId = id
                           });
            return championModel;
        }
    }
}

