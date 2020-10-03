using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class ActiveSessionsException : Exception
    {
        public ActiveSessionsException(string message) 
            : base(message)
        {
        }
    }
}
