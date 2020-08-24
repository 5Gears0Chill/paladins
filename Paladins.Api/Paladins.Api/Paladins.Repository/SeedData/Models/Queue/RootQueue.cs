using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.SeedData.Models.Queue
{
    public class RootQueue : IRootBase
    {
        public List<QueueSeedData> Queues { get; set; }
    }
}
