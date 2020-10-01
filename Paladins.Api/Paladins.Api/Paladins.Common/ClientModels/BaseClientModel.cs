using Newtonsoft.Json;

namespace Paladins.Common.ClientModels
{
    public class BaseClientModel
    {
        [JsonProperty("ret_msg")]
        public string RetMsg { get; set; }

        [JsonIgnore]
        public bool IsFailedRequest { get; set; }
    }
}
