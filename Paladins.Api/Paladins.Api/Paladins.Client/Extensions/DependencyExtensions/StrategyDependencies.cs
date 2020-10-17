using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Strategies;
using Paladins.Common.Interfaces.Strategies;

namespace Paladins.Client.Extensions.DependencyExtensions
{ 
    public static class StrategyDependencies
    {
        public static IServiceCollection RegisterClientLevelStrategies(this IServiceCollection services)
        {
            services
                .RegisterRetMessageStrategies();

            return services;
        }

        private static IServiceCollection RegisterRetMessageStrategies(this IServiceCollection services)
        {
            services.AddScoped<IRetMessageStrategy, ApprovedRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, DefaultRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, ActiveSessionsRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, DailyLimitRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, NoMatchDetailsRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, TimeStampRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, UnAuthorizedRetMessageStrategy>();
            return services;
        }
    }
}
