using Microsoft.EntityFrameworkCore;
using Paladins.Common.DataAccess.Models;
using Paladins.Repository.PaladinsDbContext.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories.Base
{
    public partial class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {

        private DbSet<TEntity> _entities;
        private readonly IDbContext _context;


        public Repository(IDbContext context)
        {
            _context = context;
        }

        public async Task<NonDataResult> DeleteAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException(nameof(entity));
            }

            try
            {
                Entities.Remove(entity);
                return await SaveAsync();
            }
            catch (DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }
        }

        public async Task<NonDataResult> DeleteEnumerableAsync(IEnumerable<TEntity> entities)
        {
            if (entities == null)
            {
                throw new ArgumentNullException(nameof(entities));
            }
            try
            {
                Entities.RemoveRange(entities);
                return await SaveAsync();
            }
            catch (DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }
        }

        public async Task<TEntity> GetByIdAsync(object id)
        {
            return await Entities.FindAsync(id);
        }

        public async Task<NonDataResult> InsertAsync(TEntity entity)
        {
            if(entity == null)
            {
                throw new ArgumentNullException(nameof(entity));
            }
            try
            {
                await Entities.AddAsync(entity);
                return await SaveAsync();
            }
            catch(DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }
        }

        public async Task<NonDataResult> InsertEnumerableAsync(IEnumerable<TEntity> entities)
        {
            if (entities == null)
            {
                throw new ArgumentNullException(nameof(entities));
            }
            try
            {
                await Entities.AddRangeAsync(entities);
                return await SaveAsync();
            }
            catch (DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }
        }

        public async Task<NonDataResult> UpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException(nameof(entity));
            }
            try
            {
                Entities.Update(entity);
                return await SaveAsync();
            }
            catch (DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }

        }

        public async Task<NonDataResult> UpdateEnumerableAsync(IEnumerable<TEntity> entities)
        {
            if (entities == null)
            {
                throw new ArgumentNullException(nameof(entities));
            }
            try
            {
                Entities.UpdateRange(entities);
                return await SaveAsync();
                
            }
            catch (DbUpdateException ex)
            {
                throw new Exception(await GetFullErrorTextAndRollbackEntityChanges(ex), ex);
            }
        }

        public async Task<DataResult<TEntity>> SaveChangesAsync(TEntity entity)
        {
            NonDataResult result;
            if(entity.Id > 0)
            {
                result = await UpdateAsync(entity);
            }
            else
            {
                result = await InsertAsync(entity);
            }
            return new DataResult<TEntity>(entity, result);
        }

        protected virtual DbSet<TEntity> Entities
        {
            get
            {
                if(_entities == null)
                {
                    _entities = _context.Set<TEntity>();
                }
                return _entities;
            }
        }

        private async Task<NonDataResult> SaveAsync()
        {
            int rowsAffected = await _context.SaveChangesAsync();
            return new NonDataResult(rowsAffected);
        } 

        protected async Task<string> GetFullErrorTextAndRollbackEntityChanges(DbUpdateException ex)
        {
            if(_context is DbContext dbContext)
            {
                var entries = dbContext.ChangeTracker.Entries()
                    .Where(e => e.State == EntityState.Added || e.State == EntityState.Modified).ToList();
                entries.ForEach(entry => 
                {
                    try
                    {
                        entry.State = EntityState.Unchanged;
                    }
                    catch (InvalidOperationException)
                    {
                        //ignored
                    }
                });
            }

            try
            {
                await _context.SaveChangesAsync();
                return ex.ToString();
            }
            catch(Exception e)
            {
                //if after the rollabck of changes the context is still not saving,
                //return the full text of the exception that occured when saving
                return e.ToString();
            }
        }
    }
}
