using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using Paladins.Common.ClientModels;
using System.Globalization;
using System.Net.Http;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class BaseClient
    {
        public async Task<TResponse> SendRequestAsync<TResponse>(string url)
        {
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, url);

            HttpClient http = new HttpClient();
            HttpResponseMessage response = await http.SendAsync(request);

            string content = await response.Content.ReadAsStringAsync();

            var responseObject = JsonConvert.DeserializeObject<TResponse>(content, Converter.Settings);
            return responseObject;
        }
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            Formatting = Formatting.Indented,
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }
}
