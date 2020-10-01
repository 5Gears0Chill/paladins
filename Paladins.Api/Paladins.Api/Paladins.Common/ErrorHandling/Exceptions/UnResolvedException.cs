using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class UnResolvedException : Exception
    {
        public UnResolvedException(int code)
            :base($"Error Code {code} does not contain an implemented exception path")
        {
        }
    }
}
