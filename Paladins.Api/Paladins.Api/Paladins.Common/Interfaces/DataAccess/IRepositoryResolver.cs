using Paladins.Common.Interfaces.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.DataAccess
{
    public interface IRepositoryResolver
    {
        TRepository Resolve<TRepository>();
    }
}
