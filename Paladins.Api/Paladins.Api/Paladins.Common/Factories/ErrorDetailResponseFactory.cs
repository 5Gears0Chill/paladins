using Paladins.Common.ErrorHandling.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace Paladins.Common.Factories
{
    public static class ErrorDetailResponseFactory
    {
        public static ErrorDetails CreateGenericErrorDetails(string message, int statusCode, Exception ex)
        {
            return new ErrorDetails
            {
                Message = message,
                StatusCode = statusCode,
                IsErrorKnown = false,
                Title = "An Unknown Error Occured",
                Source = ex.Source,
                StackTrace = ex.StackTrace,
            };
        }

        public static ErrorDetails CreateKnownErrorDetails(string message, int statusCode, string title)
        {
            return new ErrorDetails
            {
                Message = message,
                StatusCode = statusCode,
                Title = title,
                IsErrorKnown = true,
                Source = null,
                StackTrace = null,
            };
        }

    }
}
