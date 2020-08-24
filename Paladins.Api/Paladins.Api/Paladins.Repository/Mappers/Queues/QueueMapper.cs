using Paladins.Repository.Entities;
using Paladins.Repository.SeedData.Data.Queue;
using Paladins.Repository.SeedData.Models.Queue;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Repository.Mappers.Queues
{
    public class QueueMapper: MapperBase<RootQueue>, IQueueMapper
    {
        public IEnumerable<Queue> MapEnumerable()
        {
            var from = LoadJson(QueueData.CreateInstance());

            return from.Queues.Select(l => new Queue
            {
                Name = l.Name,
                PqueueId = l.Id
            });
        }
    }
}
