﻿using Microsoft.AspNetCore.Http;
using Paladins.Common.Builders;
using Paladins.Common.ErrorHandling.Handlers;
using Paladins.Common.Factories;
using Paladins.Common.Interfaces.Loggings;
using System;
using System.Net;
using System.Threading.Tasks;

namespace Paladins.Api.Middlware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private IExceptionLogger _logger;
     
        public ExceptionMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext httpContext, IExceptionLogger exceptionLogger)
        {
            _logger = exceptionLogger;

            try
            {
                await _next(httpContext);
            }
            catch(Exception ex)
            {
                await HandleExceptionsAsync(httpContext, ex);
            }
        }

        private Task HandleExceptionsAsync(HttpContext context, Exception ex)
        {
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            context.Response.ContentType = "application/json";
            try
            {
                ErrorType errorType = GenerateErrorHandler(ex);
                if (errorType.IsError())
                {
                    context.Response.StatusCode = errorType.Get().StatusCode;
                    _logger.Log(ex, errorType.Get().ResultCode);
                    return errorType.GenericResponse(context,
                        ErrorDetailResponseFactory.CreateKnownErrorDetails(ex.Message, errorType.Get().ResultCode, errorType.Get().Title));
                }
                _logger.Log(ex, errorType.Get().ResultCode);
                return errorType.GenericResponse(context,
                       ErrorDetailResponseFactory.CreateGenericErrorDetails(ex.Message, context.Response.StatusCode, ex));
            }
            catch(Exception e)
            {
                _logger.Log(ex);
                return HandleError.WithDefaultJsonConverter(context,
                       ErrorDetailResponseFactory.CreateGenericErrorDetails(e.Message, context.Response.StatusCode, e));
            }
        }

        private ErrorType GenerateErrorHandler(Exception ex)
        {
            Type typeArgument = ex.GetType();
            ErrorType errorType = ObjectCreator.NewInstance<ErrorType>(new[] { typeArgument });
            return errorType;
            
        }
    }
}
