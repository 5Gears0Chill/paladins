using Microsoft.Extensions.DependencyInjection;
using Paladins.Common.Interfaces.Validation;
using Paladins.Common.Validation;
using Paladins.Common.Validation.Validators;

namespace Paladins.Common.Extensions.DependencyExtensions
{
    public static class ValidationDependencies
    {
        public static IServiceCollection RegisterValidation(this IServiceCollection services)
        {
            return services
                .RegisterValidators()
                .RegisterOverallValidator();
        }
        private static IServiceCollection RegisterValidators(this IServiceCollection services)
        {
            services.AddScoped<IValidator, MatchIdValidator>();
            return services;
        }
         private static IServiceCollection RegisterOverallValidator(this IServiceCollection services)
        {
            services.AddScoped<IResponseValidator, ResponseValidator>();
            services.AddScoped<IValidationAttributeList, ValidationAttributeList>();
            return services;
        }
    }
}
