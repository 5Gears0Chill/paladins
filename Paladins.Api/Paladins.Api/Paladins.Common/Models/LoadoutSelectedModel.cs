using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class LoadoutSelectedModel : IModel
    {
        public int PaladinsMatchId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public int PaladinsItemId { get; set; }
        public int LoadoutItemLevel { get; set; }
        public string LoadoutItemName { get; set; }
    }
}
