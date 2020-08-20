using Microsoft.EntityFrameworkCore;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.PaladinsDbContext.Interfaces
{
    /// <summary>
    /// Represent DbContext
    /// </summary>
    public partial interface IDbContext
    {
        DbSet<TEntity> Set<TEntity>() where TEntity : BaseEntity;

        Task<int> SaveChangesAsync();
    }
}
