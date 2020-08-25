using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.DataAccess
{
    public interface IUnitOfWork
    {
        TRepository Get<TRepository>();
    }
}
