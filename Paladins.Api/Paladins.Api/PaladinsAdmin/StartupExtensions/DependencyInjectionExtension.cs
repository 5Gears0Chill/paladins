using Microsoft.Extensions.DependencyInjection;
using Paladins.Api.StartupExtensions.Dependencies;
using PaladinsAdmin.StartupExtensions.Dependencies;

namespace PaladinsAdmin.StartupExtensions
{
    public static class DependencyInjectionExtensions
    {
        public static void RegisterAllDependencies(this IServiceCollection services)
        {
            services
                .RegisterAdminHandlers()
                .RegisterFactories();

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
