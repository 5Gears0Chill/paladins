using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities.Admin;

namespace Paladins.Repository.DbContexts.Configurations.Admin
{
    public class ExceptionLogConfiguration : IEntityTypeConfiguration<ExceptionLog>
    {
        public void Configure(EntityTypeBuilder<ExceptionLog> entity)
        {
            entity.ToTable("ExceptionLog", "Admin");
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.ErrorCode)
                .IsRequired();
            entity.Property(e => e.ErrorMessage)
                .IsRequired();
            entity.Property(e => e.ErrorType)
                .IsRequired();
            entity.Property(e => e.EventDate)
                .IsRequired();
            entity.Property(e => e.StackTrace)
                .IsRequired();
            entity.Property(e => e.IsActive)
                .HasDefaultValue(true);
        }
    }
}
