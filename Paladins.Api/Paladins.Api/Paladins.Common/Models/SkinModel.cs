using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class SkinModel : IModel
    {
        public int PaladinsChampionId { get; set; }
        public string Rarity { get; set; }
        public int PaladinsSkinId { get; set; }
        public string SkinName { get; set; }
    }
}
