using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class PlayerLoadoutItemModel : IModel
    {
        public int Id { get; set; }
        public int PaladinsItemId { get; set; }
        public string ItemName { get; set; }
        public string ItemUrl { get; set; }
        public string Description { get; set; }
        public int PointsAssignedToItem { get; set; }
        public string CardName { get; set; }
    }
}
