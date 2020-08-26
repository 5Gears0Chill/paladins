using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.DataAccess.Models
{
    public abstract partial class AuditBaseEntity : BaseEntity
    {
        public DateTime CreatedOn { get; set; }
        public DateTime LastUpdatedOn { get; set; }
       
    }
}
