using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Resolvers;
using Paladins.Common.ErrorHandling.Resolvers;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Resolvers;

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class ResolverDependencies
    {
        
        public static IServiceCollection RegisterResolvers(this IServiceCollection services)
        {
            services
                .RegisterControllerResolver()
                .RegisterMiscResolvers();
            return services;
        } 
        
        private static IServiceCollection RegisterControllerResolver(this IServiceCollection services)
        {
            services.AddScoped<IControllerRequestResolver, ControllerRequestResolver>();
            return services;
        }
        private static IServiceCollection RegisterMiscResolvers(this IServiceCollection services)
        {
            services.AddScoped<IStrategyResolver, StrategyResolver>();
            services.AddScoped<IErrorCodeResolver, ErrorCodeResolver>();
            services.AddScoped<IRetMessageResolver, RetMessageResolver>();
            return services;
        }
    }
}
