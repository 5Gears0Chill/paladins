using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class ChampionAbilities : AuditBaseEntity
    {

        public int AbilityId { get; set; }
        public int ChampionId { get; set; }
        public virtual Ability Ability { get; set; }
        public virtual Champion Champion { get; set; }
    }
}
