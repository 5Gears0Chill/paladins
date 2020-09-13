using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Models
{
    public class ItemsBoughtModel
    { 
        public int PaladinsItemId { get; set; }
        public string ItemName { get; set; }
        public int ItemLevel { get; set; }
        public int ItemOrder { get; set; }
    }
}
