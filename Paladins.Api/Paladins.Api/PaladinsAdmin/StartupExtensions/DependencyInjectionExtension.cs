using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.StartupExtensions.Dependencies;

namespace PaladinsAdmin.StartupExtensions
{
    public static class DependencyInjectionExtensions
    {
        public static void RegisterAllDependencies(this IServiceCollection services)
        {
            services
                .RegisterHandlers()
                .RegisterFactories();
        }
    }
}
