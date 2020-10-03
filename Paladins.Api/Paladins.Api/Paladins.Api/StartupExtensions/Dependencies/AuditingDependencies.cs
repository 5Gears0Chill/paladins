using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Auditing;

namespace Paladins.Api.StartupExtensions.Dependencies
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
