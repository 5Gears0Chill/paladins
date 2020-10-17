using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Clients;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;

namespace Paladins.Client.Extensions.DependencyExtensions
{
    public static class ClientDependencies
    {
        public static IServiceCollection RegisterClients(this IServiceCollection services)
        {
            services.AddScoped<ISessionClient, SessionClient>();
            services.AddScoped<IPlayerClient, PlayerClient>();
            services.AddScoped<IGeneralClient, GeneralClient>();
            services.AddScoped<IMatchClient, MatchClient>();
            return services;
        }
    }
}
