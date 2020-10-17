using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Interfaces.Services;
using Paladins.Service.Services;
using Paladins.Service.Services.Admin;
using Paladins.Service.Services.Mobile;

namespace Paladins.Service.Extensions.DependencyExtensions
{
    public static class ServiceDependencies
    {
        public static IServiceCollection RegisterServices(this IServiceCollection services)
        {
            services.AddScoped<ISessionService, SessionService>();
            services.AddScoped<IPlayerService, PlayerService>();
            services.AddScoped<IGeneralService, GeneralService>();
            services.AddScoped<IMatchService, MatchService>();
            services.AddScoped<ISeedService, SeedService>();
            services.AddScoped<IPlayerMobileService, PlayerMobileService>();
            services.AddScoped<IPlayerAdminService, PlayerAdminService>();
            return services;
        }
    }
}
