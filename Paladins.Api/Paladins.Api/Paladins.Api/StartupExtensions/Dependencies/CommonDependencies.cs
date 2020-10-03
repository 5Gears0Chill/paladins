using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Session;
using Paladins.Common.Builders;
using Paladins.Common.Interfaces.Builders;

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class CommonDependencies
    {
        public static IServiceCollection RegisterCommon(this IServiceCollection services)
        {
            services.AddScoped<IRequestUrlBuilder, RequestUrlBuilder>();
            services.AddScoped<ISignatureBuilder, SignatureBuilder>();

            return services;
        }
    }
}
