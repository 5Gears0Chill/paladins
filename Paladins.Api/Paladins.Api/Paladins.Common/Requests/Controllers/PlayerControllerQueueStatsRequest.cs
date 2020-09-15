using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests.Controllers
{
    public class PlayerControllerQueueStatsRequest
    {
        [Required]
        public string QueueId { get; set; }
        [Required]
        public string PlayerName { get; set; }
    }
}
