using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Repositories;
using Paladins.Repository.Repositories.Admin;

namespace Paladins.Repository.Extensions.DependencyExtensions
{
    public static class RepositoryDependencies
    {

        public static IServiceCollection RegisterRepositoryPattern(this IServiceCollection services)
        {
            services
                .RegisterRepositories()
                .RegisterUnitOfWorkManagers();
            return services;
        }
        private static IServiceCollection RegisterRepositories(this IServiceCollection services)
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
            services.AddScoped<IApiUsageFrequencyRepository, ApiUsageFrequencyRepository>();
            return services;
        }

        private static IServiceCollection RegisterUnitOfWorkManagers(this IServiceCollection services)
        {
            services.AddScoped<IRepositoryResolver, RepositoryResolver>();
            services.AddScoped<IUnitOfWork, UnitOfWork<PaladinsDbContext>>();
            services.AddScoped<IUnitOfWorkManager, UnitOfWorkManager<PaladinsDbContext>>();
            return services;
        }
    }
}
