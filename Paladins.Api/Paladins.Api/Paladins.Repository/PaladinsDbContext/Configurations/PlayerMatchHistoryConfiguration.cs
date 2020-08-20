using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.PaladinsDbContext.Configurations
{
    public class PlayerMatchHistoryConfiguration : IEntityTypeConfiguration<PlayerMatchHistory>
    {
        public void Configure(EntityTypeBuilder<PlayerMatchHistory> entity)
        {
            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.MatchDetails)
                .WithMany(p => p.PlayerMatchHistory)
                .HasForeignKey(d => d.MatchDetailsId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerMatchHistory_MatchDetails");

            entity.HasOne(d => d.Player)
                .WithMany(p => p.PlayerMatchHistory)
                .HasForeignKey(d => d.PlayerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerMatchHistory_Player");
        }
    }
}
