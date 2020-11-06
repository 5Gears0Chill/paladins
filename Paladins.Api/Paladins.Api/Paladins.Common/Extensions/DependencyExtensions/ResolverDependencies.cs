using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.ErrorHandling.Resolvers;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Resolvers;

namespace Paladins.Common.Extensions.DependencyExtensions
{
    public static class ResolverDependencies
    {
        
        public static IServiceCollection RegisterCommonLevelResolvers(this IServiceCollection services)
        {
            services
                .RegisterControllerResolver()
                .RegisterCommonResolvers();
            return services;
        } 
        
        private static IServiceCollection RegisterControllerResolver(this IServiceCollection services)
        {
            services.AddScoped<IControllerRequestResolver, ControllerRequestResolver>();
            return services;
        }
        private static IServiceCollection RegisterCommonResolvers(this IServiceCollection services)
        {
            services.AddScoped<IStrategyResolver, StrategyResolver>();
            services.AddScoped<IErrorCodeResolver, ErrorCodeResolver>();
            services.AddScoped<IAttributeValidationResolver, AttributeValidationResolver>();
            return services;
        }
    }
}
