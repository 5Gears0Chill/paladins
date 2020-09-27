using System.ComponentModel.DataAnnotations;

namespace Paladins.Common.Requests
{
    public class PlayerQueueStatsRequest: PlayerBaseRequest
    {
        [Required]
        public string QueueId { get; set; }

    }
}
