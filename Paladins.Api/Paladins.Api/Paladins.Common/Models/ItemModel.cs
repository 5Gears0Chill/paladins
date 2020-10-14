using Paladins.Common.Interfaces.Definitions;
using System;

namespace Paladins.Common.Models
{
    public class ItemModel : IModel
    {
        public int Id { get; set; }
        public int PaladinsItemId { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public string DeviceName { get; set; }
        public int PaladinsChampionId { get; set; }
        public Uri ItemIconUrl { get; set; }
        public int Price { get; set; }
        public string ItemType { get; set; }
    }
}
