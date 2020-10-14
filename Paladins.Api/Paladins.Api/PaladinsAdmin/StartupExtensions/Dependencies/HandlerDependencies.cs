using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.Framework.Factories;
using PaladinsAdmin.Framework.Interfaces.Handlers;

namespace PaladinsAdmin.StartupExtensions.Dependencies
{
    public static class HandlerDependencies
    {
        public static IServiceCollection RegisterHandlers(this IServiceCollection services)
        {
            services.AddScoped<IPlayerAdminHandler, PlayerAdminHandler>();
            return services;
        }
    }
}
