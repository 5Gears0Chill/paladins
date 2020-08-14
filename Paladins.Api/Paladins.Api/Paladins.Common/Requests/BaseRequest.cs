using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class BaseRequest
    {
        [Required]
        public string SessionId { get; set; }
    }
}
