using Paladins.Common.Constants;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Loggings;
using Paladins.Common.Interfaces.Repositories.Admin;
using Paladins.Common.Models.Admin;
using System;
using System.Threading.Tasks;

namespace Paladins.Common.ErrorHandling.Loggings
{
    public class ExceptionLogger : IExceptionLogger
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public ExceptionLogger(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;
        }


        public async Task Log(ExceptionLogModel model)
        {
            await _unitOfWorkManager.ExecuteSingleAsync<IExceptionLogRepository, bool>(u => u.InsertLogAsync(model));
        }

        public async Task Log(Exception e, int errorCode = ErrorCodes.Default)
        {
            await Log(new ExceptionLogModel 
            {
                ErrorMessage = e.Message,
                ErrorCode = errorCode,
                ErrorType = e.GetType().FullName,
                EventDate = DateTime.Now,
                StackTrace = e.StackTrace,
            });
        }
        public async Task Log(string message, Exception e, int errorCode = ErrorCodes.Default)
        {
            await Log(new ExceptionLogModel
            {
                ErrorMessage =$"{message} --- {e.Message}",
                ErrorCode = errorCode,
                ErrorType = e.GetType().FullName,
                EventDate = DateTime.Now,
                StackTrace = e.StackTrace,
            });
        }
    }
}
