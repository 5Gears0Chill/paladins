using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class LoadoutItem : AuditBaseEntity
    {
        public int LoadoutId { get; set; }
        public int PitemId { get; set; }
        public int Points { get; set; }
        public string Name { get; set; }

        public virtual Loadout Loadout { get; set; }
        public virtual Item Pitem { get; set; }
    }
}
