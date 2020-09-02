using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers.Skins
{
    public class SkinEFMapper : IMapper<SkinModel, Skin>
    {
        public Skin Map(SkinModel from)
        {
            return new Skin
            {
                PchampionId = from.PaladinsChampionId,
                PskinId = from.PaladinsSkinId,
                Name = from.SkinName,
                Rarity = from.Rarity
            };
        }
    }
}
