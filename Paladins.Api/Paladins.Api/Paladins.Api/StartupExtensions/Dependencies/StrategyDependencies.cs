using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Strategies;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Service.Strategies;

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class StrategyDependencies
    {
        public static IServiceCollection RegisterStrategies(this IServiceCollection services)
        {
            services
                .RegisterPlayerServiceStrategies()
                .RegisterRetMessageStrategies();

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

        private static IServiceCollection RegisterRetMessageStrategies(this IServiceCollection services)
        {
            services.AddScoped<IRetMessageStrategy, ApprovedRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, DefaultRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, ActiveSessionsRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, DailyLimitRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, NoMatchDetailsRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, TimeStampRetMessageStrategy>();
            services.AddScoped<IRetMessageStrategy, UnAuthorizedRetMessageStrategy>();
            return services;
        }
    }
}
