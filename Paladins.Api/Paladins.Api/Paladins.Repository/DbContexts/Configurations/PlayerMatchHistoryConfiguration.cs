﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class PlayerMatchHistoryConfiguration : IEntityTypeConfiguration<PlayerMatchHistory>
    {
        public void Configure(EntityTypeBuilder<PlayerMatchHistory> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();


            entity.HasOne(d => d.Player)
                .WithMany(p => p.PlayerMatchHistory)
                .HasForeignKey(d => d.PlayerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerMatchHistory_Player");

            entity.HasOne(d => d.Champion)
                .WithMany(c => c.PlayerMatchHistories)
                .HasForeignKey(d => d.PchampionId);
              
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
