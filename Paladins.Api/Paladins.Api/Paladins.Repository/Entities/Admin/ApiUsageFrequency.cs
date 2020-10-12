using Paladins.Common.DataAccess.Models;

namespace Paladins.Repository.Entities.Admin
{
    public class ApiUsageFrequency: AuditBaseEntity
    {
        public int ActionEndPointId { get; set; }
        public virtual ActionEndPoint ActionEndPoint { get; set; }
    }
}
