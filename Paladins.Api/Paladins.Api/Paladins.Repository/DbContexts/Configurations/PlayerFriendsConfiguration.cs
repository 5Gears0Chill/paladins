using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class PlayerFriendsConfiguration : IEntityTypeConfiguration<PlayerFriends>
    {
        public void Configure(EntityTypeBuilder<PlayerFriends> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(d => d.Friend)
                .WithMany(p => p.PlayerFriends)
                .HasForeignKey(d => d.FriendId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerFriends_Friends");

            entity.HasOne(d => d.Player)
                .WithMany(p => p.PlayerFriends)
                .HasForeignKey(d => d.PlayerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerFriends_Player");

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
