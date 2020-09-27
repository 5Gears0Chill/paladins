using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class PlayerMatchHistory : AuditBaseEntity
    {
        public PlayerMatchHistory()
        {
            MatchDetails = new HashSet<MatchDetails>();
        }

        public int PlayerId { get; set; }
        public int PplayerId { get; set; }
        public int PchampionId { get; set; }
        public int PmatchId { get; set; }
        public string MatchResult { get; set; }
        public int Kills { get; set; }
        public int Deaths { get; set; }
        public int Assists { get; set; }
        public virtual ICollection<MatchDetails> MatchDetails { get; set; }
        public virtual Player Player { get; set; }
        public virtual Champion Champion { get; set; }
    }
}
