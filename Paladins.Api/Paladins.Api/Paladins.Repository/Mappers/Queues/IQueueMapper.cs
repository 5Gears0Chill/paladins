using Paladins.Repository.Entities;
using System.Collections.Generic;

namespace Paladins.Repository.Mappers.Queues
{
    public interface IQueueMapper
    {
        IEnumerable<Queue> MapEnumerable();
    }
}
