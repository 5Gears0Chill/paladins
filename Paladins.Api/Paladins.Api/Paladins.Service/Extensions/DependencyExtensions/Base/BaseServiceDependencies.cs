using Microsoft.Extensions.DependencyInjection;

namespace Paladins.Service.Extensions.DependencyExtensions.Base
{
    public static class BaseServiceDependencies
    {
        public static IServiceCollection RegisterPaladinsService(this IServiceCollection services)
        {
            services.RegisterServices()
                .RegisterSessionManager()
                .RegisterServiceLevelStrategies();
            return services;
        }
    }
}
