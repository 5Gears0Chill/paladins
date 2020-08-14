using Newtonsoft.Json;
using Paladins.Common.Converters;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.Match
{
    public partial class MatchIdsClientModel
    {
        [JsonProperty("Active_Flag")]
        public string ActiveFlag { get; set; }

        [JsonProperty("Match")]
        public string Match { get; set; }

        [JsonProperty("ret_msg")]
        public object RetMsg { get; set; }
    }
}
