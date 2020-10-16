using Microsoft.Extensions.DependencyInjection;
using PaladinsAdmin.Factories;
using PaladinsAdmin.Factories.Interfaces;

namespace PaladinsAdmin.StartupExtensions.Dependencies
{
    public static class FactoryDependencies
    {
        public static IServiceCollection RegisterFactories(this IServiceCollection services)
        {
            services.AddScoped<IPlayerModelFactory, PlayerModelFactory>();
            return services;
        }
    }
}
