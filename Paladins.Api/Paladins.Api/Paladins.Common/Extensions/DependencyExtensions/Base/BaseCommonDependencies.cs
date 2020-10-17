using Microsoft.Extensions.DependencyInjection;

namespace Paladins.Common.Extensions.DependencyExtensions.Base
{
    public static class BaseCommonDependencies
    {
        public static IServiceCollection RegisterPaladinsCommon(this IServiceCollection services)
        {
            services
                .RegisterAppSettings()
                .RegisterAuditing()
                .RegisterBuilders()
                .RegisterCommonLevelResolvers();
            return services;
        }
    }
}
