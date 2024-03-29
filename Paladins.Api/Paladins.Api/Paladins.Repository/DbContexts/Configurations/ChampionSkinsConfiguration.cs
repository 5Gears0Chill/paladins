﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class ChampionSkinsConfiguration : IEntityTypeConfiguration<ChampionSkins>
    {
        public void Configure(EntityTypeBuilder<ChampionSkins> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(d => d.Champion)
                .WithMany(p => p.ChampionSkins)
                .HasForeignKey(d => d.ChampionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChampionSkins_Champion");

            entity.HasOne(d => d.Skin)
                .WithMany(p => p.ChampionSkins)
                .HasForeignKey(d => d.SkinId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChampionSkins_Skin");

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
