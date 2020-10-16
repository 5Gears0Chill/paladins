using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Configuration;
using Paladins.Common.Interfaces.Configuration;

namespace PaladinsAdmin.StartupExtensions
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
