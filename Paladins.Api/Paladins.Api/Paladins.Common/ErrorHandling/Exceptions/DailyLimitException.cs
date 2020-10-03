using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class DailyLimitException : Exception
    {
        public DailyLimitException(string message)
            : base(message)
        {
        }
    }
}
