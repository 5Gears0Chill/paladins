using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Mappers
{
    public class SkinMapper : IMapper<GeneralChampionsSkinsClientModel, SkinModel[]>
    {
        public SkinModel[] Map(GeneralChampionsSkinsClientModel s)
        {
            SkinModel firstModel = new SkinModel
            {
                PaladinsChampionId = Convert.ToInt32(s.ChampionId),
                PaladinsSkinId = Convert.ToInt32(s.SkinId1),
                Rarity = s.Rarity,
                SkinName = s.SkinName,
            };

            SkinModel secondModel = new SkinModel
            {
                PaladinsChampionId = Convert.ToInt32(s.ChampionId),
                PaladinsSkinId = Convert.ToInt32(s.SkinId2),
                Rarity = s.Rarity,
                SkinName = s.SkinName,
            };
            return new SkinModel[] { firstModel, secondModel};
        }
    }
}
