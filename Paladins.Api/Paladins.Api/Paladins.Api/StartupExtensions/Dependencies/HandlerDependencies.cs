using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Handlers;
using Paladins.Common.Interfaces.Handlers;

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class HandlerDependencies
    {
        public static IServiceCollection RegisterHandlers(this IServiceCollection services)
        {
            services.AddScoped<IClientRetMessageHandler, ClientRetMessageHandler>();
            return services;
        }
    }
}
