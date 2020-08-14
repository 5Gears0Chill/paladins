﻿using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Clients;
using Paladins.Client.Session;
using Paladins.Common.Builders;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.Services;
using Paladins.Service.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Api.StartupExtensions
{
    public static class DependencyInjectionExtensions
    {
        public static void AddModulesToContainer(this IServiceCollection services)
        {
            RegisterCommon(services);
            RegisterClients(services);
            RegisterServices(services);
        }

        private static void RegisterServices(IServiceCollection services)
        {
            services.AddScoped<ISessionService, SessionService>();
            services.AddScoped<IPlayerService, PlayerService>();
            services.AddScoped<IGeneralService, GeneralService>();
            services.AddScoped<IMatchService, MatchService>();
        }

        private static void RegisterClients(IServiceCollection services)
        {
            services.AddScoped<ISessionClient, SessionClient>();
            services.AddScoped<IPlayerClient, PlayerClient>();
            services.AddScoped<IGeneralClient, GeneralClient>();
            services.AddScoped<IMatchClient, MatchClient>();
        }

        private static void RegisterCommon(IServiceCollection services)
        {
            services.AddScoped<IRequestUrlBuilder, RequestUrlBuilder>();
            services.AddScoped<ISignatureBuilder, SignatureBuilder>();
        }
    }
}
