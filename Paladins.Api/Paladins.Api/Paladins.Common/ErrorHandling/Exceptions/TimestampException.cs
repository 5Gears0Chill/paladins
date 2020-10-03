using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class TimestampException : Exception
    {
        public TimestampException(string message)
            :base(message)
        {
        }
    }
}
