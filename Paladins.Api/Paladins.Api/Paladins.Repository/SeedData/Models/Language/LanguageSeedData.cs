using Newtonsoft.Json;

namespace Paladins.Repository.SeedData.Models.Language
{
    public class LanguageSeedData
    {
        [JsonProperty("id")]
        public int Id { get; set; }
        [JsonProperty("name")]
        public string Name { get; set; }
    }
}
