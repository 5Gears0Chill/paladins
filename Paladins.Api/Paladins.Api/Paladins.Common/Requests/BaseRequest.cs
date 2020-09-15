using System.ComponentModel.DataAnnotations;

namespace Paladins.Common.Requests
{
    public class BaseRequest
    {
        [Required]
        public string SessionId { get; set; }
    }
}
