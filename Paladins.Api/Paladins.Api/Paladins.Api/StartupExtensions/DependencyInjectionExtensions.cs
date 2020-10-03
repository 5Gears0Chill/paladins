using Microsoft.Extensions.DependencyInjection;
using Paladins.Api.StartupExtensions.Dependencies;

namespace Paladins.Api.StartupExtensions
{
    public static class DependencyInjectionExtensions
    {
        public static void RegisterAllDependencies(this IServiceCollection services)
        {
            services
            .RegisterCommon()
            .RegisterClients()
            .RegisterServices()
            .RegisterAuditing()
            .RegisterSessionManager()
            .RegisterRepositoryPattern()
            .RegisterMappers()
            .RegisterStrategies()
            .RegisterResolvers()
            .RegisterHandlers();
        }
    }
}
