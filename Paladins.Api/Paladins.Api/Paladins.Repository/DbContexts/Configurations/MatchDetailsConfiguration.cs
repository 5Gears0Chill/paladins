using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class MatchDetailsConfiguration : IEntityTypeConfiguration<MatchDetails>
    {
        public void Configure(EntityTypeBuilder<MatchDetails> entity)
        {
            entity.HasIndex(e => e.PmatchId)
                .HasName("CHK_PMatchId")
                .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.HasReplay)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.Property(e => e.MapGameType)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.MapName)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.PchampionSkinId).HasColumnName("PChampionSkinID");

            entity.Property(e => e.PlayerName)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PmatchId).HasColumnName("PMatchId");

            entity.Property(e => e.PplayerId).HasColumnName("PPlayerId");

            entity.Property(e => e.PqueueId).HasColumnName("PQueueId");

            entity.Property(e => e.Region)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.Property(e => e.WinStatus)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.HasOne(d => d.LeagueTierNavigation)
                .WithMany(p => p.MatchDetails)
                .HasPrincipalKey(p => p.PtierId)
                .HasForeignKey(d => d.LeagueTier)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MatchDetails_Tier");

            entity.HasOne(d => d.Pqueue)
                .WithMany(p => p.MatchDetails)
                .HasPrincipalKey(p => p.PqueueId)
                .HasForeignKey(d => d.PqueueId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MatchDetails_Queue");

            entity.HasOne(d => d.PlayerMatchHistory)
              .WithMany(p => p.MatchDetails)
              .HasPrincipalKey(p => p.Id)
              .HasForeignKey(d => d.PlayerMatchHistoryId)
              .OnDelete(DeleteBehavior.ClientSetNull)
              .HasConstraintName("FK_MatchDetails_PlayerMatchHistory");

            entity.Property(e => e.CreatedOn)
              .IsRequired()
              .IsUnicode(false)
              .HasColumnType("datetime")
              .HasDefaultValue(DateTime.UtcNow);

            entity.Property(e => e.LastUpdatedOn)
                .IsRequired()
                .IsUnicode(false)
                .HasColumnType("datetime")
                .HasDefaultValue(DateTime.UtcNow);
        }
    }
}
