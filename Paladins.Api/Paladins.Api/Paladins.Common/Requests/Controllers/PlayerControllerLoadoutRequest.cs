using System.ComponentModel.DataAnnotations;

namespace Paladins.Common.Requests.Controllers
{
    public class PlayerControllerLoadoutRequest
    {
        [Required]
        public int LanguageId { get; set; }
        [Required]
        public string PlayerName { get; set; }
    }
}
