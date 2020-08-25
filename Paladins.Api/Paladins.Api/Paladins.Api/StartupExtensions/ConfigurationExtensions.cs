using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Configuration;
using Paladins.Common.Interfaces.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Api.StartupExtensions
{
    public static class ConfigurationExtensions
    {
        public static void ConfigureAppSettingsJson(this IServiceCollection services, IConfiguration Configuration)
        {
            services.AddSingleton((_) => Configuration.GetObjectFromConfiguration<DataConnections>("DataConnections"));
            services.AddSingleton((_) => Configuration.GetObjectFromConfiguration<LogLevel>("Logging:LogLevel"));
        }

        public static void RegisterAppSettings(this IServiceCollection services)
        {
            services.AddScoped<IAppSettings, AppSettings>();
        }
    }
}
