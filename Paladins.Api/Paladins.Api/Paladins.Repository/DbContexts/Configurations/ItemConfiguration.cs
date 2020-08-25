using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class ItemConfiguration : IEntityTypeConfiguration<Item>
    {
        public void Configure(EntityTypeBuilder<Item> entity)
        {


            entity.HasIndex(e => e.PitemId)
                .HasName("CHK_PItemId")
                .IsUnique();

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Description)
                .IsRequired()
                .IsUnicode(false);

            entity.Property(e => e.DeviceName)
                .IsRequired()
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.Property(e => e.ItemIconUrl).IsUnicode(false);

            entity.Property(e => e.ItemType)
                .IsRequired()
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.PitemId).HasColumnName("PItemId");

            entity.Property(e => e.ShortDescription).IsUnicode(false);
        }
    }
}
