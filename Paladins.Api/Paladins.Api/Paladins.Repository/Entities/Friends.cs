using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Friends : BaseEntity
    {
        public Friends()
        {
            PlayerFriends = new HashSet<PlayerFriends>();
        }

        public int PplayerId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<PlayerFriends> PlayerFriends { get; set; }
    }
}
