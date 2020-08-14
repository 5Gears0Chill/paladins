using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class PlayerBaseRequest : BaseRequest
    {
        [Required]
        public string PlayerName { get; set; }
    }
}
