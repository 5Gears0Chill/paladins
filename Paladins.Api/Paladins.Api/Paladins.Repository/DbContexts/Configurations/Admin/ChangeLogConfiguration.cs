using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities.Admin;

namespace Paladins.Repository.DbContexts.Configurations.Admin
{
    public class ChangeLogConfiguration : IEntityTypeConfiguration<ChangeLog>
    {
        public void Configure(EntityTypeBuilder<ChangeLog> entity)
        {
            entity.ToTable("ChangeLog", "Admin");
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.DatabaseName)
                 .IsRequired();
            entity.Property(e => e.EventDate)
                 .IsRequired();
            entity.Property(e => e.EventType)
                 .IsRequired();
            entity.Property(e => e.ObjectName)
                 .IsRequired();
            entity.Property(e => e.ObjectType)
                 .IsRequired();
            entity.Property(e => e.SqlCommand)
                 .IsRequired();
            entity.Property(e => e.LoginName)
                 .IsRequired();
        }
    }
}
