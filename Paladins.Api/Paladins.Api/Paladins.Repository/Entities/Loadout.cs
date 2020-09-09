using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Loadout : AuditBaseEntity
    {
        public Loadout()
        {
            LoadoutItem = new HashSet<LoadoutItem>();
        }

        public int PchampionId { get; set; }
        public string LoadoutName { get; set; }
        public int PloadoutId { get; set; }
        public int PplayerId { get; set; }
        public string PlayerName { get; set; }

        public virtual Champion Champion { get; set; }
        public virtual ICollection<LoadoutItem> LoadoutItem { get; set; }
    }
}
