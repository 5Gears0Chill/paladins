using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class PlayerMatchHistory : AuditBaseEntity
    {
        public int PlayerId { get; set; }
        public int MatchDetailsId { get; set; }

        public virtual MatchDetails MatchDetails { get; set; }
        public virtual Player Player { get; set; }
    }
}
