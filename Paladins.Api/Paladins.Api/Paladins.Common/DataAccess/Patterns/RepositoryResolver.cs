using Paladins.Common.Interfaces.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.DataAccess.Patterns
{
    public class RepositoryResolver : IRepositoryResolver
    {
        private readonly IServiceProvider _serviceProvider;

        public RepositoryResolver(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public TRepository Resolve<TRepository>()
        {
            return (TRepository)_serviceProvider.GetService(typeof(TRepository));
        }
    }
}
