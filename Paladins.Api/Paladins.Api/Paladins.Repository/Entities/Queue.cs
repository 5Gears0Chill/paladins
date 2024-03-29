﻿using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Queue : AuditBaseEntity
    {
        public Queue()
        {
            MatchDetails = new HashSet<MatchDetails>();
        }

        public int PqueueId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<MatchDetails> MatchDetails { get; set; }
    }
}
