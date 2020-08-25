using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.DbContexts.Configurations
{
    public class ChampionAbilitiesConfiguration : IEntityTypeConfiguration<ChampionAbilities>
    {
        public void Configure(EntityTypeBuilder<ChampionAbilities> entity)
        {

            entity.Property(e => e.Id).UseIdentityColumn().ValueGeneratedOnAdd();

            entity.HasOne(d => d.Ability)
                .WithMany(p => p.ChampionAbilities)
                .HasForeignKey(d => d.AbilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChampionAbilities_Ability");

            entity.HasOne(d => d.Champion)
                .WithMany(p => p.ChampionAbilities)
                .HasForeignKey(d => d.ChampionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChampionAbilities_Champion");
        }
    }
}
