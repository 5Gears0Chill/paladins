using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.Factories;
using PaladinsAdmin.Factories.Interfaces;

namespace PaladinsAdmin.Extensions.DependencyExtensions
{
    public static class FactoryDependencies
    {
        public static IServiceCollection RegisterFactories(this IServiceCollection services)
        {
            services.AddScoped<IPlayerModelFactory, PlayerModelFactory>();
            services.AddScoped<IExceptionLogFactory, ExceptionLogFactory>();
            services.AddScoped<IChangeLogFactory, ChangeLogFactory>();
            services.AddScoped<IApiUsageLogFactory, ApiUsageLogFactory>();
            return services;
        }
    }
}
