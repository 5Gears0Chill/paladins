using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Paladins.Common.Configuration;
using Paladins.Common.Interfaces.Configuration;
using Paladins.Repository.DbContexts.Configurations;
using Paladins.Repository.Entities;

namespace Paladins.Repository.DbContexts
{
    public partial class PaladinsDbContext : BaseDbContext
    {
        public static readonly ILoggerFactory loggerFactory 
            = LoggerFactory.Create(builder => { builder.AddConsole(); });

        private readonly IAppSettings _appSettings;

        public PaladinsDbContext(IAppSettings appSettings)
        {
            _appSettings = appSettings;
        }

        public PaladinsDbContext(DbContextOptions<PaladinsDbContext> options, AppSettings appSettings)
            : base(options)
        {
            _appSettings = appSettings;
        }

       

        public virtual DbSet<Ability> Ability { get; set; }
        public virtual DbSet<Champion> Champion { get; set; }
        public virtual DbSet<ChampionAbilities> ChampionAbilities { get; set; }
        public virtual DbSet<ChampionSkins> ChampionSkins { get; set; }
        public virtual DbSet<Friends> Friends { get; set; }
        public virtual DbSet<Item> Item { get; set; }
        public virtual DbSet<ItemsBought> ItemsBought { get; set; }
        public virtual DbSet<Language> Language { get; set; }
        public virtual DbSet<Loadout> Loadout { get; set; }
        public virtual DbSet<LoadoutItem> LoadoutItem { get; set; }
        public virtual DbSet<LoadoutSelected> LoadoutSelected { get; set; }
        public virtual DbSet<MatchBans> MatchBans { get; set; }
        public virtual DbSet<MatchDetails> MatchDetails { get; set; }
        public virtual DbSet<Player> Player { get; set; }
        public virtual DbSet<PlayerChampionStats> PlayerChampionStats { get; set; }
        public virtual DbSet<PlayerFriends> PlayerFriends { get; set; }
        public virtual DbSet<PlayerMatchHistory> PlayerMatchHistory { get; set; }
        public virtual DbSet<PlayerRankDetails> PlayerRankDetails { get; set; }
        public virtual DbSet<Queue> Queue { get; set; }
        public virtual DbSet<Skin> Skin { get; set; }
        public virtual DbSet<Tier> Tier { get; set; }

      
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {            
                optionsBuilder
                    .UseLoggerFactory(loggerFactory)
                    .EnableSensitiveDataLogging()
                     .UseSqlServer(_appSettings.GetDataConnections().ConnectionString);
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new AbilityConfiguration());
            modelBuilder.ApplyConfiguration(new ChampionAbilitiesConfiguration());
            modelBuilder.ApplyConfiguration(new ChampionConfiguration());
            modelBuilder.ApplyConfiguration(new ChampionSkinsConfiguration());
            modelBuilder.ApplyConfiguration(new FriendsConfiguration());
            modelBuilder.ApplyConfiguration(new ItemConfiguration());
            modelBuilder.ApplyConfiguration(new ItemsBoughtConfiguration());
            modelBuilder.ApplyConfiguration(new LanguageConfiguration());
            modelBuilder.ApplyConfiguration(new LoadoutConfiguration());
            modelBuilder.ApplyConfiguration(new LoadoutItemConfiguration());
            modelBuilder.ApplyConfiguration(new LoadoutSelectedConfiguration());
            modelBuilder.ApplyConfiguration(new MatchBansConfiguration());
            modelBuilder.ApplyConfiguration(new MatchDetailsConfiguration());
            modelBuilder.ApplyConfiguration(new PlayerChampionStatsConfiguration());
            modelBuilder.ApplyConfiguration(new PlayerConfiguration());
            modelBuilder.ApplyConfiguration(new PlayerFriendsConfiguration());
            modelBuilder.ApplyConfiguration(new PlayerMatchHistoryConfiguration());
            modelBuilder.ApplyConfiguration(new PlayerRankDetailsConfiguration());
            modelBuilder.ApplyConfiguration(new QueueConfiguration());
            modelBuilder.ApplyConfiguration(new SkinConfiguration());
            modelBuilder.ApplyConfiguration(new TierConfiguration());
        }  
    }
}
