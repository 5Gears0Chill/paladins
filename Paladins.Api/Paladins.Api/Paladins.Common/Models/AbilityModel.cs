using Paladins.Common.Interfaces.Definitions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Models
{
    public class AbilityModel : IModel
    {
        public string Description { get; set; }
        public int PaladinsAbilityId { get; set; }
        public string Name { get; set; }
        public Uri Url { get; set; }
    }
}
