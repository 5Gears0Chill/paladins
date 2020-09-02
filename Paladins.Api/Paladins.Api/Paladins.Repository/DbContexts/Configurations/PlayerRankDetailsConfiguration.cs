using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class PlayerRankDetailsConfiguration : IEntityTypeConfiguration<PlayerRankDetails>
    {
        public void Configure(EntityTypeBuilder<PlayerRankDetails> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(d => d.Player)
               .WithMany(p => p.PlayerRankDetails)
               .HasForeignKey(d => d.PlayerId)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_PlayerRankDetails_Player");

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
