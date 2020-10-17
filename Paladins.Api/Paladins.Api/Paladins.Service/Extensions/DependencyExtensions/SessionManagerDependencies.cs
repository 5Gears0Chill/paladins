using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Interfaces.SessionManager;

namespace Paladins.Service.Extensions.DependencyExtensions
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
