using Paladins.Common.Interfaces.Definitions;
using System;

namespace Paladins.Common.Models.Admin
{
    public class ApiUsageModel : IModel
    {
        public int Id { get; set; }
        public string ActionName { get; set; }
        public string Category { get; set; }
        public DateTime EventDate { get; set; }
    }
}
