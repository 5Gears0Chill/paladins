using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class PlayerChampionStatsConfiguration : IEntityTypeConfiguration<PlayerChampionStats>
    {
        public void Configure(EntityTypeBuilder<PlayerChampionStats> entity)
        {
            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(d => d.Pchampion)
                .WithMany(p => p.PlayerChampionStats)
                .HasPrincipalKey(p => p.PchampionId)
                .HasForeignKey(d => d.PchampionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerChampionStats_Champion");

            entity.HasOne(d => d.Player)
                .WithMany(p => p.PlayerChampionStats)
                .HasForeignKey(d => d.PlayerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerChampionStats_Player");
        }
    }
}
