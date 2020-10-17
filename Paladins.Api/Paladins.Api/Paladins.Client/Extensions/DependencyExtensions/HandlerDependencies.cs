using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Handlers;
using Paladins.Common.Interfaces.Handlers;

namespace Paladins.Client.Extensions.DependencyExtensions
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
