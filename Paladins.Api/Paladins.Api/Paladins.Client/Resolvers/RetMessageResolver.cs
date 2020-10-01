using Paladins.Common.Constants;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Interfaces.Strategies;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Client.Resolvers
{
    public class RetMessageResolver : IRetMessageResolver
    {
        public IEnumerable<IRetMessageStrategy> _strategies;

        public RetMessageResolver(IEnumerable<IRetMessageStrategy> strategies)
        {
            _strategies = strategies;
        }

        public IRetMessageStrategy Resolve(string message)
        {
            if (message.IsNotNull())
            {
                var strategy = _strategies.SingleOrDefault(x => x.IsApplicable(message));
                if (strategy.IsNull()) return _strategies.Single(x => x.IsApplicable(RetMessageConstants.Default));
                return strategy;
            }
            return _strategies.Single(x => x.IsApplicable(RetMessageConstants.Default));
        }
    }
}
