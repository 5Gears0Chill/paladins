using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.PaladinsDbContext.Configurations
{
    public class LoadoutConfiguration : IEntityTypeConfiguration<Loadout>
    {
        public void Configure(EntityTypeBuilder<Loadout> entity)
        {
            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.Property(e => e.LoadoutName)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.PlayerName)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PloadoutId).HasColumnName("PLoadoutId");

            entity.Property(e => e.PplayerId).HasColumnName("PPlayerId");

            entity.HasOne(d => d.PlayerChampionStats)
                .WithMany(p => p.Loadout)
                .HasForeignKey(d => d.PlayerChampionStatsId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Loadout_PlayerChampionStats");
        }
    }
}
