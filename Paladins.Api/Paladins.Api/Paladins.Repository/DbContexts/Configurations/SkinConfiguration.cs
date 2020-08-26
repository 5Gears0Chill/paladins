using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class SkinConfiguration : IEntityTypeConfiguration<Skin>
    {
        public void Configure(EntityTypeBuilder<Skin> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Name)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.PskinId).HasColumnName("PSkinId");

            entity.Property(e => e.Rarity)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Pchampion)
                .WithMany(p => p.Skin)
                .HasPrincipalKey(p => p.PchampionId)
                .HasForeignKey(d => d.PchampionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Skin_Champion");

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
