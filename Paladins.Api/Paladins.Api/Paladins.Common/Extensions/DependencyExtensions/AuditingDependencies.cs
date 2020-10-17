using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Auditing;

namespace Paladins.Common.Extensions.DependencyExtensions
{
    public static class AuditingDependencies
    {
        public static IServiceCollection RegisterAuditing(this IServiceCollection services)
        {
            services.AddScoped<IAuditManager, AuditManager>();
            return services;
        }
    }
}
