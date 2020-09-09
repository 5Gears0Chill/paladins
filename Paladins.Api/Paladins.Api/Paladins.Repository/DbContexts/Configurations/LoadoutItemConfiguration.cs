using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class LoadoutItemConfiguration : IEntityTypeConfiguration<LoadoutItem>
    {
        public void Configure(EntityTypeBuilder<LoadoutItem> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.Property(e => e.PitemId).HasColumnName("PItemId");

            entity.HasOne(d => d.Loadout)
                .WithMany(p => p.LoadoutItem)
                .HasForeignKey(d => d.LoadoutId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_LoadoutItem_Loadout");

            entity.HasOne(d => d.Pitem)
                .WithMany(p => p.LoadoutItem)
                .HasPrincipalKey(p => p.PitemId)
                .HasForeignKey(d => d.PitemId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_LoadoutItem_Item");
        }
    }
}
