using Newtonsoft.Json;

namespace Paladins.Repository.SeedData.Models.Tier
{
    public class TierSeedData
    {
        [JsonProperty("id")]
        public int Id { get; set; }
        [JsonProperty("name")]
        public string Name { get; set; }
    }
}
