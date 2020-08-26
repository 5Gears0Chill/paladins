using Paladins.Common.DataAccess.Models;
using System.Collections.Generic;

namespace Paladins.Common.Auditing
{
    public interface IAuditManager
    {
        TEntity SetUpdateAudit<TEntity>(TEntity entity) where TEntity : BaseEntity;
        TEntity SetNewAudit<TEntity>(TEntity entity) where TEntity : BaseEntity;
        IEnumerable<TEntity> SetAuditList<TEntity>(IEnumerable<TEntity> entities) where TEntity : BaseEntity;
    }
}
