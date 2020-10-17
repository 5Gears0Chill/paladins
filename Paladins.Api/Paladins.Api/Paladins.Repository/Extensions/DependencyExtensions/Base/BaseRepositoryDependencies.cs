using Microsoft.Extensions.DependencyInjection;

namespace Paladins.Repository.Extensions.DependencyExtensions.Base
{
    public static class BaseRepositoryDependencies
    {
        public static IServiceCollection RegisterPaladinsRepository(this IServiceCollection services)
        {
            services.RegisterRepositoryPattern()
                .RegisterMappers();
            return services;
        }
    }
}
