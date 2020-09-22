using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Requests.Controllers
{
    public class ItemPagedRequest : PagedRequest
    {
        public int ChampionId { get; set; }
    }
}
