using Paladins.Common.DataAccess.Models;
using System;

namespace Paladins.Repository.Entities.Admin
{
    public class ExceptionLog : BaseEntity
    {
        public string ErrorType { get; set; }
        public string ErrorMessage { get; set; }
        public string StackTrace { get; set; }
        public int ErrorCode { get; set; }
        public DateTime EventDate { get; set; }
    }
}
