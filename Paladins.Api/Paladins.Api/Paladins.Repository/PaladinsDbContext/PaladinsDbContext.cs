using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Console;
using Paladins.Common.DataAccess.Models;
using Paladins.Repository.Entities;
using Paladins.Repository.PaladinsDbContext.Configurations;
using Paladins.Repository.PaladinsDbContext.Interfaces;

namespace Paladins.Repository.PaladinsDbContext
{
    public partial class PaladinsDbContext : DbContext, IDbContext
    {
        public static readonly ILoggerFactory loggerFactory 
            = LoggerFactory.Create(builder => { builder.AddConsole(); });

        #region Ctor
        public PaladinsDbContext()
        {
        }

        public PaladinsDbContext(DbContextOptions<PaladinsDbContext> options)
            : base(options)
        {
        }
        #endregion
        #region DbSets

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
        public virtual DbSet<Queue> Queue { get; set; }
        public virtual DbSet<Skin> Skin { get; set; }
        public virtual DbSet<Tier> Tier { get; set; }

        #endregion
        #region configuration
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {            
                optionsBuilder
                    .UseLoggerFactory(loggerFactory)
                    .EnableSensitiveDataLogging()
                     .UseSqlServer("Server=.\\SQLEXPRESS;Database=Paladins_DB;User Id=sa;Password=Yesterday280396!;"); ;
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
            modelBuilder.ApplyConfiguration(new QueueConfiguration());
            modelBuilder.ApplyConfiguration(new SkinConfiguration());
            modelBuilder.ApplyConfiguration(new TierConfiguration());
        }
        #endregion
        #region methods

        public virtual new DbSet<TEntity> Set<TEntity>() where TEntity : BaseEntity 
            => base.Set<TEntity>();


        public Task<int> SaveChangesAsync()
        {
            //add audit layer here
            return base.SaveChangesAsync();
        }
        #endregion
    }
}
