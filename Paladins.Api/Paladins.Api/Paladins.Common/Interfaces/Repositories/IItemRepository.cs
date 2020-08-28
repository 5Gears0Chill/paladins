using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IItemRepository : IRepositoryCore
    {
        Task<NonDataResult> InsertItemsAsync(IEnumerable<ItemModel> items);
    }
}
