﻿using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class PlayerChampionStats : AuditBaseEntity
    {
        public PlayerChampionStats()
        {
        }

        public int PlayerId { get; set; }
        public int PchampionId { get; set; }
        public int Assists { get; set; }
        public int Deaths { get; set; }
        public int Kills { get; set; }
        public int Rank { get; set; }
        public int Wins { get; set; }
        public int Losses { get; set; }
        public virtual Champion Champion { get; set; }
        public virtual Player Player { get; set; }
    }
}
