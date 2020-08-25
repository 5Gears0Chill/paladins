using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Queues;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class QueueRepository: Repository<PaladinsDbContext>, IQueueRepository
    {
        private readonly IQueueMapper _mapper;

        public QueueRepository(IQueueMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseQueuesAsync()
        {
            var queues = _mapper.MapEnumerable();
            return await InsertListAsync(queues);
        }
    }
}
