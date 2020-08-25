using Paladins.Common.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.Configuration
{
    public interface IAppSettings
    {
        DataConnections GetDataConnections();
        Logging GetLogging();
    }
}
