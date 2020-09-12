using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Resolvers;
using System;

namespace Paladins.Common.Resolvers
{
    public class StrategyResolver : IStrategyResolver
    {
        private readonly IServiceProvider _serviceProvider;

        public StrategyResolver(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public TStrategy Resolve<TStrategy>()
        {
            var strategy = (TStrategy)_serviceProvider.GetService(typeof(TStrategy));
            if (strategy.IsNull())
            {
                throw new ArgumentNullException($"Could not fetch {typeof(TStrategy).Name} from ServiceProvider");
            }
            return strategy;
        }
    }
}
