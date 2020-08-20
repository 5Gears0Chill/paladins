using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Item : BaseEntity
    {
        public Item()
        {
            LoadoutItem = new HashSet<LoadoutItem>();
        }

        public int PitemId { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public string DeviceName { get; set; }
        public int PchampionId { get; set; }
        public string ItemIconUrl { get; set; }
        public int Price { get; set; }
        public string ItemType { get; set; }

        public virtual ICollection<LoadoutItem> LoadoutItem { get; set; }
    }
}
