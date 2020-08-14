using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Requests
{
    public class PlayerLoadoutsRequest: PlayerBaseRequest
    {
        public int LanguageId { get; set; }
    }
}
