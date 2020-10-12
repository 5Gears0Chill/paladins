using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Paladins.Common.ClientModels;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Handlers;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
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
        private IUnitOfWorkManager _unitOfWorkManager;
        public BaseClient(IClientRetMessageHandler clientRetMessageHandler, IUnitOfWorkManager unitOfWorkManager)
        {
            _clientRetMessageHandler = clientRetMessageHandler;
            _unitOfWorkManager = unitOfWorkManager;
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

        public async Task LogUsageStat(string actionName)
        {
            var action = await _unitOfWorkManager.ExecuteSingleAsync<IApiUsageFrequencyRepository, ActionEndPointModel>(u => u.GetActionAsync(actionName));
            if (action.IsNotNull())
            {
                var response =  await _unitOfWorkManager.ExecuteSingleAsync<IApiUsageFrequencyRepository, bool>(u => u.InsertUsage(action.Id));
                if (!response)
                {
                    //log here
                }
            }
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
