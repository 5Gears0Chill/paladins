using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Clients;
using Paladins.Client.Session;
using Paladins.Common.Auditing;
using Paladins.Common.Builders;
using Paladins.Common.ClientModels.General;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Builders;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Interfaces.SessionManager;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Mappers;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Resolvers;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using Paladins.Repository.Mappers.Abilities;
using Paladins.Repository.Mappers.Champions;
using Paladins.Repository.Mappers.Friends;
using Paladins.Repository.Mappers.Items;
using Paladins.Repository.Mappers.Languages;
using Paladins.Repository.Mappers.Players;
using Paladins.Repository.Mappers.Queues;
using Paladins.Repository.Mappers.Skins;
using Paladins.Repository.Mappers.Tiers;
using Paladins.Repository.Repositories;
using Paladins.Service;
using Paladins.Service.Services;
using Paladins.Service.Strategies;
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
            RegisterSessionManager(services);
            RegisterRepositories(services);
            RegisterMappers(services);
            RegisterStrategies(services);
            RegisterControllerResolver(services);
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
            services.AddScoped<IItemRepository, ItemRepository>();
            services.AddScoped<IAbilityRepository, AbilityRepository>();
            services.AddScoped<IChampionRepository, ChampionRepository>();
            services.AddScoped<IChampionAbilitiesRepository, ChampionAbilitiesRepository>();
            services.AddScoped<ISkinRepository, SkinRepository>();
            services.AddScoped<IPlayerRepository, PlayerRepository>();
            services.AddScoped<IFriendRepository, FriendRepository>();
            services.AddScoped<ILoadoutRepository, LoadoutRepository>();
            services.AddScoped<IMatchHistoryRepository, MatchHistoryRepository>();
            services.AddScoped<IMatchDetailsRepository, MatchDetailsRepository>();
        }

        private static void RegisterMappers(IServiceCollection services)
        {
            services.AddScoped<ILanguageMapper, LanguageMapper>();
            services.AddScoped<IQueueMapper, QueueMapper>();
            services.AddScoped<ITierMapper, TierMapper>();
            services.AddScoped<IMapper<ItemModel, Item>, ItemEFMapper>();
            services.AddScoped<IMapper<GeneralItemsClientModel, ItemModel>, ItemMapper>();
            services.AddScoped<IMapper<GeneralChampionsClientModel, ChampionModel>, ChampionMapper>();
            services.AddScoped<IMapper<AbilityModel, Repository.Entities.Ability>,AbilityEFMapper>();
            services.AddScoped<IMapper<ChampionModel, Champion>,ChampionEFMapper>();
            services.AddScoped<IMapper<GeneralChampionsSkinsClientModel, SkinModel[]>, SkinMapper>();
            services.AddScoped<IMapper<SkinModel, Skin>, SkinEFMapper>();
            services.AddScoped<IMapper<PlayerClientModel, PlayerModel>, PlayerMapper>();
            services.AddScoped<IMapper<PlayerModel, Player>, PlayerEFMapper>();
            services.AddScoped<IMapper<Player, PlayerModel>, EFPlayerMapper>();
            services.AddScoped<IMapper<FriendModel, Friend>, FriendEFMapper>();
            services.AddScoped<IMapper<PlayerChampionStatsModel, PlayerChampionStats>, ChampionStatsEFMapper>();
            services.AddScoped<IMapper<MatchDetailsClientModel, MatchDetailsModel>, MatchDetailsMapper>();
        }

        private static void RegisterStrategies(IServiceCollection services)
        {
            services.AddScoped<IBasePlayerStrategy,BasePlayerStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, MatchDetailsClientModel, PlayerMatchHistoryModel>,
                PlayerMatchHistoryStrategy>();         
            services.AddScoped<IPlayerStrategy<PlayerLoadoutsRequest, PlayerLoadoutsClientModel, PlayerLoadoutModel>,
                PlayerLoadoutStrategy>();  
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, PlayerFriendsClientModel, FriendModel>,
                PlayerFriendStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, PlayerChampionRanksClientModel, PlayerChampionStatsModel>,
                PlayerChampionStatsStrategy>();
        }
        private static void RegisterControllerResolver(IServiceCollection services)
        {
            services.AddScoped<IControllerRequestResolver, ControllerRequestResolver>();
        }

        private static void RegisterAuditing(IServiceCollection services)
        {
            services.AddScoped<IAuditManager, AuditManager>();
        }

        private static void RegisterSessionManager(IServiceCollection services)
        {
            services.AddScoped<ISessionManager, SessionManager>();
        }

        public static void RegisterUnitOfWorkManagers(this IServiceCollection services)
        {
            //var resolver = new RepositoryResolver(serviceProvider);

            //services.AddScoped<IRepositoryResolver>((_) => resolver);

            //var paladinsUnitOfWork = new UnitOfWork<PaladinsDbContext>(resolver);

            //services.AddScoped<IUnitOfWorkManager>((_) => 
            //new UnitOfWorkManager<PaladinsDbContext>(serviceProvider, paladinsUnitOfWork));

            services.AddScoped<IRepositoryResolver,RepositoryResolver>();
            services.AddScoped<IUnitOfWork,UnitOfWork<PaladinsDbContext>>();
            services.AddScoped<IUnitOfWorkManager, UnitOfWorkManager<PaladinsDbContext>>();
        }

        public static void RegisterStrategyResolvers(this IServiceCollection services)
        {
            services.AddScoped<IStrategyResolver, StrategyResolver>();
        }
    }
}
