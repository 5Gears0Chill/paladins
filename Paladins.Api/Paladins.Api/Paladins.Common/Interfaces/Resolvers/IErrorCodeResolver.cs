using System;

namespace Paladins.Common.Interfaces.Resolvers
{
    public interface IErrorCodeResolver
    {
        Exception Resolve(int code, string message);
    }
}
