using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class FriendConfiguration : IEntityTypeConfiguration<Friend>
    {
        public void Configure(EntityTypeBuilder<Friend> entity)
        {

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.Property(e => e.PplayerId)
                .HasColumnName("PPlayerId");

            entity.HasOne(d => d.Player)
              .WithMany(p => p.Friends)
              .HasForeignKey(d => d.PlayerId)
              .OnDelete(DeleteBehavior.ClientSetNull)
              .HasConstraintName("FK_Friend_Player");

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
