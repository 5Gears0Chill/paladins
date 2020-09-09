using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Models
{
    public class FriendModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PaladinsPlayerId { get; set; }
        public int AccountId { get; set; }
        public DateTime LastUpdatedOn { get; set; }
        public DateTime CreatedOn { get; set; }

    }
}
