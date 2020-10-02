using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Paladins.Common.ClientModels;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Handlers;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Paladins.Client.Clients
{
    public class BaseClient
    {
        private readonly IClientRetMessageHandler _clientRetMessageHandler;

        public BaseClient(IClientRetMessageHandler clientRetMessageHandler)
        {
            _clientRetMessageHandler = clientRetMessageHandler;
        }

        public async Task<TResponse> SendRequestAsync<TResponse>(string url)
        {
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, url);

            HttpClient http = new HttpClient();
            HttpResponseMessage response = await http.SendAsync(request);

            string content = await response.Content.ReadAsStringAsync();

            var responseObject = JsonConvert.DeserializeObject<TResponse>(content, Converter.Settings);
            return responseObject;
        }

        public List<IClientResponse> HandleRetMessageReponse<IClientResponse>(List<IClientResponse> responses) where IClientResponse : BaseClientModel
        {
            return (from r in responses
                    let x = _clientRetMessageHandler.HandleRetMessage(r)
                    where x.IsNotNull()
                    select x).ToList();
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
