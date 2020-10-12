using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities.Admin;
using System;

namespace Paladins.Repository.DbContexts.Configurations.Admin
{
    class ApiUsageFrequencyConfiguration : IEntityTypeConfiguration<ApiUsageFrequency>
    {
        public void Configure(EntityTypeBuilder<ApiUsageFrequency> entity)
        {
            entity.ToTable("ApiUsageFrequency", "Admin");
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(e => e.ActionEndPoint)
                .WithMany(e => e.ApiUsageFrequencies)
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
