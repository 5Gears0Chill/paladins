using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Models
{
    public class ErrorResponseModel
    {
        public string Message { get; set; }
        public bool IsFailedRequest { get; set; }
        public int ErrorCode { get; set; }
    }
}
