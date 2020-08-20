using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class PlayerFriends : BaseEntity
    {
        public int PlayerId { get; set; }
        public int FriendId { get; set; }

        public virtual Friends Friend { get; set; }
        public virtual Player Player { get; set; }
    }
}
