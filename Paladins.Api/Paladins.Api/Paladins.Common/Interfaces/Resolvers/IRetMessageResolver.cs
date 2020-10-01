using Paladins.Common.Interfaces.Strategies;

namespace Paladins.Common.Interfaces.Resolvers
{
    public interface IRetMessageResolver
    {
        IRetMessageStrategy Resolve(string message);
    }
}
