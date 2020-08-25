using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class TierConfiguration : IEntityTypeConfiguration<Tier>
    {
        public void Configure(EntityTypeBuilder<Tier> entity)
        {
            entity.HasIndex(e => e.PtierId)
                .HasName("CHK_PTierId")
                .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.Property(e => e.PtierId).HasColumnName("PTierId");
        }
    }
}
