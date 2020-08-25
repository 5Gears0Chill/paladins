using Microsoft.EntityFrameworkCore;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Common.DataAccess.Patterns
{
    public partial class Repository<TContext> : IRepositoryCore
        where TContext : IDbContext
    {

        protected TContext Context;

        public void SetContext(IDbContext context)
        {
            Context = (TContext)context;
        }

        public void DisposeContext()
        {
            Context.Dispose();
        }

        public async Task<DataResult<TEntity>> SaveAsync<TEntity>(TEntity entity) where TEntity : BaseEntity
        {
            int rowsAffected;
            if (entity.Id > 0)
            {
                rowsAffected = await Context.UpdateAsync(entity);
            }
            else
            {
                rowsAffected = await Context.InsertAsync(entity);
            }
            return new DataResult<TEntity>(rowsAffected, entity);
        }

        public async Task<DataListResult<TEntity>> InsertListAsync<TEntity>(IEnumerable<TEntity> entities) where TEntity : BaseEntity
        {
            var rowsAffected = await Context.InsertEnumerableAsync(entities);
            return new DataListResult<TEntity>(rowsAffected, entities);
        }

        public async Task<DataListResult<TEntity>> UpdateListAsync<TEntity>(IEnumerable<TEntity> entities) where TEntity : BaseEntity
        {
            var rowsAffected = await Context.UpdateEnumerableAsync(entities);
            return new DataListResult<TEntity>(rowsAffected, entities);
        }

        public async Task<DataResult<TEntity>> DeleteAsync<TEntity>(TEntity entity) where TEntity : BaseEntity
        {
            var rowsAffected = await Context.DeleteAsync(entity);
            return new DataResult<TEntity>(rowsAffected, entity);
        }


        public async Task<DataListResult<TEntity>> DeleteListAsync<TEntity>(IEnumerable<TEntity> entities) where TEntity : BaseEntity
        {
            var rowsAffected = await Context.DeleteEnumerableAsync(entities);
            return new DataListResult<TEntity>(rowsAffected, entities);
        }
    }
}
