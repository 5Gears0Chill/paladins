using System;

namespace PaladinsAdmin.Models.Log
{
    public class ExceptionLogListItemModel
    {
        public string ErrorType { get; set; }
        public string ErrorMessage { get; set; }
        public string StackTrace { get; set; }
        public int ErrorCode { get; set; }
        public DateTime EventDate { get; set; }
    }
}
