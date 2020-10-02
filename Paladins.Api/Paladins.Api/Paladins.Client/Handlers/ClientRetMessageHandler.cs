using Paladins.Common.ClientModels;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Handlers;
using Paladins.Common.Interfaces.Resolvers;

namespace Paladins.Client.Handlers
{
    public class ClientRetMessageHandler : IClientRetMessageHandler
    {
        private readonly IRetMessageResolver _retMessageResolver;
        private readonly IErrorCodeResolver _errorCodeResolver;

        public ClientRetMessageHandler(IRetMessageResolver retMessageResolver, IErrorCodeResolver errorCodeResolver)
        {
            _retMessageResolver = retMessageResolver;
            _errorCodeResolver = errorCodeResolver;
        }

        public TClientResponse HandleRetMessage<TClientResponse>(TClientResponse response) where TClientResponse : BaseClientModel
        {
            var strategy = _retMessageResolver.Resolve(response.RetMsg);
            var error = strategy.PropogateModel(response);
            if (error.IsNotNull())
            {
                throw _errorCodeResolver.Resolve(error.ErrorCode, error.Message);
            }
            return response;
        }
    }
}
