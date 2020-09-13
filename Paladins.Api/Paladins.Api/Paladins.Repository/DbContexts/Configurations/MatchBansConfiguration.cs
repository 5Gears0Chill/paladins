using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class MatchBansConfiguration : IEntityTypeConfiguration<MatchBans>
    {
        public void Configure(EntityTypeBuilder<MatchBans> entity)
        {
            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.Property(e => e.PchampionId).HasColumnName("PChampionId");

            entity.Property(e => e.PmatchId).HasColumnName("PMatchId");

            entity.HasOne(d => d.MatchDetails)
                .WithMany(p => p.MatchBans)
                .HasForeignKey(d => d.MatchDetailsId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MatchBans_MatchDetails");

            entity.HasOne(d => d.Pchampion)
                .WithMany(p => p.MatchBans)
                .HasPrincipalKey(p => p.PchampionId)
                .HasForeignKey(d => d.PchampionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MatchBans_Champion");
        }
    }
}
