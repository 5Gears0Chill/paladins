using Newtonsoft.Json;

namespace Paladins.Common.ClientModels.Match
{
    public partial class MatchIdsClientModel : BaseClientModel
    {
        [JsonProperty("Active_Flag")]
        public string ActiveFlag { get; set; }

        [JsonProperty("Match")]
        public string Match { get; set; }
    }
}
