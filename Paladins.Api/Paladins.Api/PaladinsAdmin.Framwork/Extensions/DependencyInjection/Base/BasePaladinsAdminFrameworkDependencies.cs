using Microsoft.Extensions.DependencyInjection;

namespace PaladinsAdmin.Framework.Extensions.DependencyInjection.Base
{
    public static class BasePaladinsAdminFrameworkDependencies
    {
        public static IServiceCollection RegisterPaladinsAdminFramework(this IServiceCollection services)
        {
            services
                .RegisterAdminHandlers();
            return services;
        }
    }
}
