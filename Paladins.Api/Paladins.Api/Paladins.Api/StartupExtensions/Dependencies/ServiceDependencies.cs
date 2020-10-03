using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Interfaces.Services;
using Paladins.Service.Services;
using Paladins.Service.Services.Mobile;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Api.StartupExtensions.Dependencies
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
            return services;
        }
    }
}
