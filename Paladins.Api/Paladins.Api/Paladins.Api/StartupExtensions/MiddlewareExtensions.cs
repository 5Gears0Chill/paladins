using Microsoft.AspNetCore.Builder;
using Paladins.Api.Middlware;

namespace Paladins.Api.StartupExtensions
{
    public static class MiddlewareExtensions
    {
        public static void ConfigureCustomMiddleWare(this IApplicationBuilder application)
        {
            application.UseMiddleware<ExceptionMiddleware>();
        }
    }
}
