using Paladins.Common.ClientModels.General;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Mappers
{
    public class ItemMapper : IMapper<GeneralItemsClientModel, ItemModel>
    {
        public ItemModel Map(GeneralItemsClientModel i)
        {
            return new ItemModel
            {
                Description = i.Description,
                DeviceName = i.DeviceName,
                ItemIconUrl = i.ItemIconUrl,
                ItemType = i.ItemType,
                PaladinsItemId = Convert.ToInt32(i.ItemId),
                PaladinsChampionId = Convert.ToInt32(i.ChampionId),
                Price = Convert.ToInt32(i.Price),
                ShortDescription = i.ShortDesc,
            };
        }
    }
}
