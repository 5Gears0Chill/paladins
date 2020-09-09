namespace Paladins.Common.Models
{
    public class PlayerLoadoutItemModel
    {
        public int Id { get; set; }
        public int PaladinsItemId { get; set; }
        public int PointsAssignedToItem { get; set; }
        public string CardName { get; set; }
    }
}
