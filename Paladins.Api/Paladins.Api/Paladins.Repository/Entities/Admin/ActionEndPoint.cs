using Paladins.Common.DataAccess.Models;
using System.Collections.Generic;

namespace Paladins.Repository.Entities.Admin
{
    public class ActionEndPoint : AuditBaseEntity
    {
        public ActionEndPoint()
        {
            ApiUsageFrequencies = new HashSet<ApiUsageFrequency>();
        }
        public string ActionName { get; set; }
        public string Category { get; set; }

        public virtual ICollection<ApiUsageFrequency> ApiUsageFrequencies { get; set; }
    }
}
