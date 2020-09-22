using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests.Controllers;
using Paladins.Common.Responses;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<PagedResponse<ItemModel>> getItemsAsync(ItemPagedRequest request)
        {     
            var items = FilterByChampionId(Context.Item.Select(x => x), request.ChampionId);
            var selected = await items.Select(p => new ItemModel
            {
                Id = p.Id,
                Description = p.Description,
                DeviceName = p.DeviceName,
                ItemIconUrl = new Uri(p.ItemIconUrl),
                ItemType = p.ItemType,
                PaladinsChampionId = p.PchampionId,
                PaladinsItemId = p.PitemId,
                Price = p.Price,
                ShortDescription = p.ShortDescription
            }).ToListAsync();

            return new PagedResponse<ItemModel>(selected, request);
        }

        public async Task<NonDataResult> InsertItemsAsync(IEnumerable<ItemModel> items)
        {
            var filtered = items
                .DistinctBy(item => item.PaladinsItemId)
                .Select(x => _mapper.Map(x));
            return await InsertListAsync(filtered);  
        }

        private IQueryable<Item> FilterByChampionId(IQueryable<Item> query,int championId)
        {
            if (championId.Equals(-1))
            {
                return query;
            }

            return query.Where(p => p.PchampionId == championId);
        }
    }
}
