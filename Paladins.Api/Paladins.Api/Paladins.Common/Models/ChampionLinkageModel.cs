using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class ChampionLinkageModel : IModel
    {
        public int PaladinsChampionId { get; set; }
        public int PaladinsAbilityId { get; set; }
    }
}
