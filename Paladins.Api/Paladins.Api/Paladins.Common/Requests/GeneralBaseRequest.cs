using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class GeneralBaseRequest : BaseRequest
    {
        [Required]
        public int LanguageId { get; set; }
    }
}
