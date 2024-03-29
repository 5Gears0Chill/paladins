﻿using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class ChampionSkins : AuditBaseEntity
    {
        public int SkinId { get; set; }
        public int ChampionId { get; set; }

        public virtual Champion Champion { get; set; }
        public virtual Skin Skin { get; set; }
    }
}
