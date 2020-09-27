using Newtonsoft.Json;

namespace Paladins.Common.Requests
{
    public class BaseRequest
    {
        [JsonIgnore]
        public string SessionId { get; set; }
    }
}
