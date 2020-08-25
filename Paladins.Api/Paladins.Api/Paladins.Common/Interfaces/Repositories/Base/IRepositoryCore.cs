using Paladins.Common.Interfaces.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.Repositories.Base
{
    public interface IRepositoryCore
    {
        void SetContext(IDbContext context);
        void DisposeContext();
    }
}
