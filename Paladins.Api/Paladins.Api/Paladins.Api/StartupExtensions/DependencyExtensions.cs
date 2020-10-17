using Microsoft.Extensions.DependencyInjection;
using Paladins.Client.Extensions.DependencyExtensions.Base;
using Paladins.Common.Extensions.DependencyExtensions.Base;
using Paladins.Repository.Extensions.DependencyExtensions.Base;
using Paladins.Service.Extensions.DependencyExtensions.Base;

namespace Paladins.Api.StartupExtensions
{
    public static class DependencyExtensions
    {
        public static void RegisterAllDependencies(this IServiceCollection services)
        {
            services
                .RegisterPaladinsCommon()
                .RegisterPaladinsRepository()
                .RegisterPaladinsClient()
                .RegisterPaladinsService();
        }
    }
}
