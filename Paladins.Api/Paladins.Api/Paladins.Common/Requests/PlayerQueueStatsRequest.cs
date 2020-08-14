using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class PlayerQueueStatsRequest: PlayerBaseRequest
    {
        [Required]
        public string QueueId { get; set; }
    }
}
