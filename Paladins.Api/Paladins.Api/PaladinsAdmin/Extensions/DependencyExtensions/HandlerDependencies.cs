using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.Framework.Handlers;
using PaladinsAdmin.Framework.Interfaces.Handlers;

namespace PaladinsAdmin.Extensions.DependencyExtensions
{
    public static class HandlerDependencies
    {
        public static IServiceCollection RegisterAdminHandlers(this IServiceCollection services)
        {
            services.AddScoped<IPlayerAdminHandler, PlayerAdminHandler>();
            return services;
        }
    }
}
