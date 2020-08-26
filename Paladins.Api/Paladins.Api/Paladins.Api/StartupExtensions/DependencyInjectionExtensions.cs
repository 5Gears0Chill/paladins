using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Clients;
using Paladins.Client.Session;
using Paladins.Common.Auditing;
using Paladins.Common.Builders;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Mappers.Languages;
using Paladins.Repository.Mappers.Queues;
using Paladins.Repository.Mappers.Tiers;
using Paladins.Repository.Repositories;
using Paladins.Service.Services;
using System;

namespace Paladins.Api.StartupExtensions
{
    public static class DependencyInjectionExtensions
    {
        public static void AddModulesToContainer(this IServiceCollection services)
        {
            RegisterCommon(services);
            RegisterClients(services);
            RegisterServices(services);
            RegisterAuditing(services);
            RegisterRepositories(services);
            RegisterMappers(services);
           
        }

        private static void RegisterServices(IServiceCollection services)
        {
            services.AddScoped<ISessionService, SessionService>();
            services.AddScoped<IPlayerService, PlayerService>();
            services.AddScoped<IGeneralService, GeneralService>();
            services.AddScoped<IMatchService, MatchService>();
            services.AddScoped<ISeedService, SeedService>();
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

        private static void RegisterRepositories(IServiceCollection services)
        {
            services.AddScoped<ILanguageRepository, LanguageRepository>();
            services.AddScoped<IQueueRepository, QueueRepository>();
            services.AddScoped<ITierRepository, TierRepository>();
        }

        private static void RegisterMappers(IServiceCollection services)
        {
            services.AddScoped<ILanguageMapper, LanguageMapper>();
            services.AddScoped<IQueueMapper, QueueMapper>();
            services.AddScoped<ITierMapper, TierMapper>();
        }

        private static void RegisterAuditing(IServiceCollection services)
        {
            services.AddScoped<IAuditManager, AuditManager>();
        }

        public static void RegisterUnitOfWorkManagers(this IServiceCollection services, IServiceProvider serviceProvider)
        {
            var resolver = new RepositoryResolver(serviceProvider);
            services.AddScoped<IRepositoryResolver>((_) => resolver);

            var paladinsUnitOfWork = new UnitOfWork<PaladinsDbContext>(resolver);

            services.AddScoped<IUnitOfWorkManager>((_) => new UnitOfWorkManager<PaladinsDbContext>(serviceProvider, paladinsUnitOfWork));
        }
    }
}
