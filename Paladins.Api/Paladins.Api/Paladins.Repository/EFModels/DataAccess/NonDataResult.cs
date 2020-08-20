using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.EFModels.DataAccess
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

        public NonDataResult()
        {
        }

        public NonDataResult(int rowsAffected)
        {
            this.RowsAffected = rowsAffected;
        }
    }

}
