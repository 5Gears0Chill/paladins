using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Service.Strategies;

namespace Paladins.Service.Extensions.DependencyExtensions
{
    public static class StrategyDependencies
    {
        public static IServiceCollection RegisterServiceLevelStrategies(this IServiceCollection services)
        {
            services
                .RegisterPlayerServiceStrategies();
            return services;
        }
        private static IServiceCollection RegisterPlayerServiceStrategies(this IServiceCollection services)
        {
            services.AddScoped<IBasePlayerStrategy, BasePlayerStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, MatchDetailsClientModel, PlayerMatchHistoryModel>,
                PlayerMatchHistoryStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerLoadoutsRequest, PlayerLoadoutsClientModel, PlayerLoadoutModel>,
                PlayerLoadoutStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, PlayerFriendsClientModel, FriendModel>,
                PlayerFriendStrategy>();
            services.AddScoped<IPlayerStrategy<PlayerBaseRequest, PlayerChampionRanksClientModel, PlayerChampionStatsModel>,
                PlayerChampionStatsStrategy>();
            return services;
        }
    }
}
