using Microsoft.Extensions.DependencyInjection;

namespace PaladinsAdmin.Extensions.DependencyExtensions.Base
{
    public static class BasePaladinsAdminDependencies
    {
        public static IServiceCollection RegisterPaladinsAdmin(this IServiceCollection services)
        {
            services
               .RegisterFactories();
            return services;
        }
    }
}
