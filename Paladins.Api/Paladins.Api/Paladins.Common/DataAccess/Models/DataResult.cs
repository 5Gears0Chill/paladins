﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.DataAccess.Models
{
    public class DataResult<TEntity> where TEntity : BaseEntity
    {
        public NonDataResult Persistence { get; private set; }
        public TEntity Data { get; private set; }

        public DataResult(TEntity data, NonDataResult nonDataResult)
        {
            this.Data = data;
            this.Persistence = nonDataResult;
        }
    }
}