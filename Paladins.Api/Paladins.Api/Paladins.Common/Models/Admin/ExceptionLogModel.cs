using Paladins.Common.Interfaces.Definitions;
using System;

namespace Paladins.Common.Models.Admin
{
    public class ExceptionLogModel : IModel
    {
        public string ErrorType { get; set; }
        public string ErrorMessage { get; set; }
        public string StackTrace { get; set; }
        public int ErrorCode { get; set; }
        public DateTime EventDate { get; set; }
    }
}
