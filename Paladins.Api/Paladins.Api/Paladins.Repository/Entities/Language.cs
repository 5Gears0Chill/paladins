using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;

namespace Paladins.Repository.Entities
{
    public partial class Language : BaseEntity
    {
        public int PlanguageId { get; set; }
        public string Name { get; set; }
    }
}
