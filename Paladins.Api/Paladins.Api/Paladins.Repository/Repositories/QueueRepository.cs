using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Queues;
using Paladins.Repository.PaladinsDbContext.Interfaces;
using Paladins.Repository.Repositories.Base;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class QueueRepository: Repository<Queue>, IQueueRepository
    {
        private readonly IQueueMapper _mapper;
        public QueueRepository(IDbContext context, IQueueMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public async Task<NonDataResult> InsertBaseQueuesAsync()
        {
            var queues = _mapper.MapEnumerable();
            return await InsertEnumerableAsync(queues);
        }
    }
}
