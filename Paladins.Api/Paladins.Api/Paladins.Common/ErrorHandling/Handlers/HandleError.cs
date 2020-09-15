using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.ErrorHandling.Handlers
{
    public class HandleError
    {
        public static Task WithDefaultJsonConverter<T>(HttpContext context, T toSerialse)
        {
            return context.Response.WriteAsync(JsonConvert.SerializeObject(toSerialse));
        }
    }
}
