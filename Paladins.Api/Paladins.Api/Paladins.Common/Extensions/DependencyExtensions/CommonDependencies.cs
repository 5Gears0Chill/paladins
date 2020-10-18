using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Session;
using Paladins.Common.Builders;
using Paladins.Common.ErrorHandling.Loggings;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Loggings;

namespace Paladins.Common.Extensions.DependencyExtensions
{
    public static class CommonDependencies
    {
        public static IServiceCollection RegisterBuilders(this IServiceCollection services)
        {
            services.AddScoped<IRequestUrlBuilder, RequestUrlBuilder>();
            services.AddScoped<ISignatureBuilder, SignatureBuilder>();
            services.AddScoped<IExceptionLogger, ExceptionLogger>();
            return services;
        }
    }
}
