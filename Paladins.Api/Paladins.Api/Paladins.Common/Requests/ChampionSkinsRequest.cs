using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class ChampionSkinsRequest : GeneralBaseRequest
    {
        [Required]
        public int ChampionId { get; set; }
    }
}
