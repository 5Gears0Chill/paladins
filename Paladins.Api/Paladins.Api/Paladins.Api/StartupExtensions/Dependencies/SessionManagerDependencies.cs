
using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Interfaces.SessionManager;
using Paladins.Service;

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class SessionManagerDependencies
    {
        public static IServiceCollection RegisterSessionManager(this IServiceCollection services)
        {
            services.AddScoped<ISessionManager, SessionManager>();
            return services;
        }
    }
}
