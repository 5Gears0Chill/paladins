using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class ItemRepository: Repository<PaladinsDbContext>, IItemRepository
    {
        private readonly IMapper<ItemModel, Item> _mapper;
        public ItemRepository(IAuditManager auditManager, IMapper<ItemModel, Item> mapper)
            :base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertItemsAsync(IEnumerable<ItemModel> items)
        {
            var filtered = items
                .DistinctBy(item => item.PaladinsItemId)
                .Select(x => _mapper.Map(x));
            return await InsertListAsync(filtered);  
        }
    }
}
