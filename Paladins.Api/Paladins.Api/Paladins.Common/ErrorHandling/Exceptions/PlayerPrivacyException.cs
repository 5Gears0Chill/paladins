using System;

namespace Paladins.Common.ErrorHandling.Exceptions
{
    public class PlayerPrivacyException : Exception
    {
        public PlayerPrivacyException(string message)
            :base(message)
        {
        }
    }
}
