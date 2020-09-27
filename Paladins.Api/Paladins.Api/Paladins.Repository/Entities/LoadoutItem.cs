using Paladins.Common.DataAccess.Models;

namespace Paladins.Repository.Entities
{
    public partial class LoadoutItem : BaseEntity
    {
        public int LoadoutId { get; set; }
        public int PitemId { get; set; }
        public int Points { get; set; }
        public string Name { get; set; }
        public virtual Loadout Loadout { get; set; }
        public virtual Item Item { get; set; }
    }
}
