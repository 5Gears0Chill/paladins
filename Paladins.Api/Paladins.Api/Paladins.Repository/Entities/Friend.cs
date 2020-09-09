using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Friend : AuditBaseEntity
    {
        public Friend()
        {
          
        }
        public int PlayerId { get; set; }
        public int PplayerId { get; set; }
        public string Name { get; set; }
        public int AccountId { get; set; }

        public virtual Player Player { get; set; }
    }
}
