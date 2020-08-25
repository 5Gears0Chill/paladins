using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.DataAccess.Models
{
    public class DataResult<TEntity> : NonDataResult
    {
        public TEntity Data { get; private set; }

        public DataResult(int rowsAffected, TEntity data)
            :base(rowsAffected)
        {
            this.Data = data;
        }
    }
}
