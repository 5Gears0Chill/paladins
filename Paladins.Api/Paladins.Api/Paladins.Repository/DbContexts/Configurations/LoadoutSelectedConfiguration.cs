﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class LoadoutSelectedConfiguration : IEntityTypeConfiguration<LoadoutSelected>
    {
        public void Configure(EntityTypeBuilder<LoadoutSelected> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.LoadoutItemName)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PitemId).HasColumnName("PItemId");

            entity.Property(e => e.PmatchId).HasColumnName("PMatchId");

            entity.Property(e => e.PplayerId).HasColumnName("PPlayerId");

            entity.HasOne(d => d.MatchDetails)
                .WithMany(p => p.LoadoutsSelected)
                .HasForeignKey(d => d.MatchDetailsId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_LoadoutSelected_MatchDetails");
        }
    }
}
