using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.Framework.Handlers;
using PaladinsAdmin.Framework.Interfaces.Handlers;

namespace PaladinsAdmin.Framework.Extensions.DependencyInjection
{
    public static class HandlerDependencies
    {
        public static IServiceCollection RegisterAdminHandlers(this IServiceCollection services)
        {
            services.AddScoped<IPlayerAdminHandler, PlayerAdminHandler>();
            services.AddScoped<IExceptionLogAdminHandler, ExceptionLogAdminHandler>();
            services.AddScoped<IChangeLogAdminHandler, ChangeLogAdminHandler>();
            return services;
        }
    }
}
