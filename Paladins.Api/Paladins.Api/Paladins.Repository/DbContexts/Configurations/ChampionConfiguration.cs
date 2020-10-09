using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class ChampionConfiguration : IEntityTypeConfiguration<Champion>
    {
        public void Configure(EntityTypeBuilder<Champion> entity)
        {

            entity.HasIndex(e => e.PchampionId)
                .HasName("CHK_PChampionId")
                .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.IsLatestChampion)
                .IsRequired()
                .HasMaxLength(5)
                .IsUnicode(false);

            entity.Property(e => e.Lore)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.Url)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.Name)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.Role)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.CreatedOn)
              .IsRequired()
              .IsUnicode(false)
              .HasColumnType("datetime")
              .HasDefaultValue(DateTime.UtcNow);

            entity.HasMany(c => c.PlayerMatchHistories)
                .WithOne(d => d.Champion)
                .HasForeignKey(c => c.PchampionId)
                .HasPrincipalKey(c => c.PchampionId);

            entity.HasMany(c => c.MatchBans)
                .WithOne(c => c.Pchampion)
                .HasForeignKey(c => c.PchampionId)
                .HasPrincipalKey(c => c.PchampionId);

            entity.HasMany(c => c.Loadouts)
                .WithOne(c => c.Champion)
                .HasPrincipalKey(c => c.PchampionId)
                .HasForeignKey(c => c.PchampionId);

            entity.HasMany(c => c.MatchDetails)
                .WithOne(d => d.Champion)
                .HasForeignKey(d => d.PchampionId)
                .HasPrincipalKey(c => c.PchampionId)
                .HasConstraintName("FK_MatchDetails_Champion");

            entity.Property(e => e.LastUpdatedOn)
                .IsRequired()
                .IsUnicode(false)
                .HasColumnType("datetime")
                .HasDefaultValue(DateTime.UtcNow);
        }
    }
}
