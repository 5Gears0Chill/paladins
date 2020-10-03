using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class MatchDetailsException : Exception
    {
        public MatchDetailsException(string message)
            :base(message)
        {
        }
    }
}
