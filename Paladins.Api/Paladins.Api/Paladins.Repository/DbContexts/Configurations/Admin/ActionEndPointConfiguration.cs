using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities.Admin;
using System;

namespace Paladins.Repository.DbContexts.Configurations.Admin
{
    public class ActionEndPointConfiguration : IEntityTypeConfiguration<ActionEndPoint>
    {
        public void Configure(EntityTypeBuilder<ActionEndPoint> entity)
        {
            entity.ToTable("ActionEndPoint", "Admin");
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.ActionName)
                .HasMaxLength(200)
                .HasColumnType("VARCHAR")
                .IsRequired();

            entity.Property(e => e.Category)
                 .HasMaxLength(200)
                 .HasColumnType("VARCHAR")
                 .IsRequired();

            entity.HasMany(e => e.ApiUsageFrequencies)
                .WithOne(e => e.ActionEndPoint)
                .HasForeignKey(e => e.ActionEndPointId)
                .HasConstraintName("FK_ApiUsageFrequency_ActionEndPoints");

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
