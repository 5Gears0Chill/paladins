using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.DataAccess.Models
{
    public class NonDataResult
    {
        public int RowsAffected { get; private set; }

        public virtual bool IsSuccessful
        {
            get
            {
                return RowsAffected > 0;
            }
        }
        public NonDataResult(int rowsAffected)
        {
            this.RowsAffected = rowsAffected;
        }
    }
}
