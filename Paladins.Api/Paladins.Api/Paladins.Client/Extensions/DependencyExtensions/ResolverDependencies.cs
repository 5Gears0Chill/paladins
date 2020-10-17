using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Resolvers;
using Paladins.Common.Interfaces.Resolvers;

namespace Paladins.Client.Extensions.DependencyExtensions
{
    public static class ResolverDependencies
    {
        public static IServiceCollection RegisterClientResolvers(this IServiceCollection services)
        {
            services.AddScoped<IRetMessageResolver, RetMessageResolver>();
            return services;
        }
    }
}
