using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers.Items
{
    public class ItemEFMapper : IMapper<ItemModel, Item>
    {
        public Item Map(ItemModel i)
        {
            return new Item
            {
                Description = i.Description,
                DeviceName = i.DeviceName,
                ItemIconUrl = i.ItemIconUrl.AbsoluteUri,
                ItemType = i.ItemType,
                PchampionId = i.PaladinsChampionId,
                PitemId = i.PaladinsItemId,
                Price = i.Price,
                ShortDescription = i.Description
            };
        }
    }
}
