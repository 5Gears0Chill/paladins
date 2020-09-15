using System.ComponentModel.DataAnnotations;

namespace Paladins.Common.Requests.Controllers
{
    public class PlayerControllerRequest
    {
        [Required]
        public string PlayerName { get; set; }
    }
}
