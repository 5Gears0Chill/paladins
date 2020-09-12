using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.Resolvers
{
    public interface IStrategyResolver
    {
        TStrategy Resolve<TStrategy>();
    }
}
