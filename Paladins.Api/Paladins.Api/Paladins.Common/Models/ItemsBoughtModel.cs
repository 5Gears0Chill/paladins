using Paladins.Common.Interfaces.Definitions;

namespace Paladins.Common.Models
{
    public class ItemsBoughtModel : IModel
    { 
        public int PaladinsItemId { get; set; }
        public string ItemName { get; set; }
        public int ItemLevel { get; set; }
        public int ItemOrder { get; set; }
    }
}
