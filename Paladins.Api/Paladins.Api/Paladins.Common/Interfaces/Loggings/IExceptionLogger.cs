using Paladins.Common.Constants;
using Paladins.Common.Models.Admin;
using System;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Loggings
{
    public interface IExceptionLogger
    {
        Task Log(ExceptionLogModel model);
        Task Log(Exception e, int errorCode = ErrorCodes.Default);
        Task Log(string message, Exception e, int errorCode = ErrorCodes.Default);
    }
}
