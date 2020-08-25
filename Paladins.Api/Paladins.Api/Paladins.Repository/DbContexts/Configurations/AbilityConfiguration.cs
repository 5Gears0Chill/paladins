using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class AbilityConfiguration : IEntityTypeConfiguration<Ability>
    {
        public void Configure(EntityTypeBuilder<Ability> entity)
        {
            entity.HasIndex(e => e.PabilityId)
                    .HasName("CHK_PAbilityId")
                    .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Description)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.Name)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.PabilityId).HasColumnName("PAbilityId");

            entity.Property(e => e.Url)
                .IsRequired()
                .IsUnicode(false);
        }
    }
}
