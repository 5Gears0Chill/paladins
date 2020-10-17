using Microsoft.Extensions.DependencyInjection;

namespace Paladins.Client.Extensions.DependencyExtensions.Base
{
    public static class BaseClientDependencies
    {
        public static IServiceCollection RegisterPaladinsClient(this IServiceCollection services)
        {
            services.RegisterClients()
                .RegisterHandlers()
                .RegisterClientResolvers()
                .RegisterClientLevelStrategies();
            return services;
        }
    }
}
