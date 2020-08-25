using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Paladins.Common.DataAccess.Models
{
    public class DataListResult<TEntity> : DataResult<IEnumerable<TEntity>>
    {
        public int TotalRecords { get; }

        public DataListResult(int rowsAffected, IEnumerable<TEntity> data)
            :base(rowsAffected, data)
        {
            TotalRecords = data.Count();
        }
    }
}
