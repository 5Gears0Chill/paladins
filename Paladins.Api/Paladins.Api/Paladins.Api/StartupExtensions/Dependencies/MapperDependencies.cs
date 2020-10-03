using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.ClientModels.General;
using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Mappers;
using Paladins.Common.Models;
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

namespace Paladins.Api.StartupExtensions.Dependencies
{
    public static class MapperDependencies
    {
        public static IServiceCollection RegisterMappers(this IServiceCollection services)
        {
            services.AddScoped<ILanguageMapper, LanguageMapper>();
            services.AddScoped<IQueueMapper, QueueMapper>();
            services.AddScoped<ITierMapper, TierMapper>();
            services.AddScoped<IMapper<ItemModel, Item>, ItemEFMapper>();
            services.AddScoped<IMapper<GeneralItemsClientModel, ItemModel>, ItemMapper>();
            services.AddScoped<IMapper<GeneralChampionsClientModel, ChampionModel>, ChampionMapper>();
            services.AddScoped<IMapper<AbilityModel, Repository.Entities.Ability>, AbilityEFMapper>();
            services.AddScoped<IMapper<ChampionModel, Champion>, ChampionEFMapper>();
            services.AddScoped<IMapper<GeneralChampionsSkinsClientModel, SkinModel[]>, SkinMapper>();
            services.AddScoped<IMapper<SkinModel, Skin>, SkinEFMapper>();
            services.AddScoped<IMapper<PlayerClientModel, PlayerModel>, PlayerMapper>();
            services.AddScoped<IMapper<PlayerModel, Player>, PlayerEFMapper>();
            services.AddScoped<IMapper<Player, PlayerModel>, EFPlayerMapper>();
            services.AddScoped<IMapper<FriendModel, Friend>, FriendEFMapper>();
            services.AddScoped<IMapper<PlayerChampionStatsModel, PlayerChampionStats>, ChampionStatsEFMapper>();
            services.AddScoped<IMapper<MatchDetailsClientModel, MatchDetailsModel>, MatchDetailsMapper>();
            return services;
        }
    }
}
