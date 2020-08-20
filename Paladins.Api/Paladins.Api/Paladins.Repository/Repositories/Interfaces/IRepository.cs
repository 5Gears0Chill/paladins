using Paladins.Repository.EFModels.DataAccess;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories.Interfaces
{
    public interface IRepository<TEntity> where TEntity: BaseEntity
    {
        /// <summary>
        /// Gets an entity by identifier
        /// </summary>
        /// <param name="id">Identifier</param>
        /// <returns>Entity</returns>
        Task<TEntity> GetByIdAsync(object id);
        /// <summary>
        /// Inserts an entity async
        /// </summary>
        /// <param name="entity">Entity</param>
        /// <returns>Success Result</returns>
        Task<NonDataResult> InsertAsync(TEntity entity);
        /// <summary>
        /// Inserts multiple entities async
        /// </summary>
        /// <param name="entities">Entities</param>
        /// <returns>Success Result and Rows Affected</returns>
        Task<NonDataResult> InsertEnumerableAsync(IEnumerable<TEntity> entities);
        /// <summary>
        /// Update an entity async
        /// </summary>
        /// <param name="entity">Entity</param>
        /// <returns>Success Result and Rows Affected</returns>
        Task<NonDataResult> UpdateAsync(TEntity entity);
        /// <summary>
        /// Update multiple entities async
        /// </summary>
        /// <param name="entities">Entities</param>
        /// <returns>Success Result and Rows Affected</returns>
        Task<NonDataResult> UpdateEnumerableAsync(IEnumerable<TEntity> entities);
        /// <summary>
        /// Delete an entity async
        /// </summary>
        /// <param name="entity">Entity</param>
        /// <returns>Success Result and Rows Affected</returns>
        Task<NonDataResult> DeleteAsync(TEntity entity);
        /// <summary>
        /// Delete multiple entities async
        /// </summary>
        /// <param name="entities">Entities</param>
        /// <returns>Success Result and Rows Affected</returns>
        Task<NonDataResult> DeleteEnumerableAsync(IEnumerable<TEntity> entities);
    }
}
