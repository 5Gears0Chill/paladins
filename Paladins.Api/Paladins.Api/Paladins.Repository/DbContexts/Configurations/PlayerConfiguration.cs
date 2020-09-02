using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class PlayerConfiguration : IEntityTypeConfiguration<Player>
    {
        public void Configure(EntityTypeBuilder<Player> entity)
        {
            entity.HasIndex(e => e.PplayerId)
                .HasName("CHK_PPlayerId")
                .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.AvatarUrl)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.LastLoginTimeStamp)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.Property(e => e.LoadingFrame)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.MasteryLevel)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.PersonalStatusMessage)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.LastLoginTimeStamp)
             .IsRequired()
             .IsUnicode(false)
             .HasColumnType("datetime")
             .HasDefaultValue(DateTime.UtcNow);

            entity.Property(e => e.AccountCreatedOnTimeStamp)
             .IsRequired()
             .IsUnicode(false)
             .HasColumnType("datetime")
             .HasDefaultValue(DateTime.UtcNow);

            entity.Property(e => e.PplayerId).HasColumnName("PPlayerId");

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
