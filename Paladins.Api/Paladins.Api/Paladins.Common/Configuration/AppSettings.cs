using Paladins.Common.Interfaces.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Configuration
{
    public class AppSettings : IAppSettings
    {
        private DataConnections DataConnections;
        private Logging Logging;

        public AppSettings(DataConnections dataConnections, LogLevel logLevel)
        {
            DataConnections = dataConnections;
            Logging = Logging.CreateInstance(logLevel);

        }


        public DataConnections GetDataConnections()
        {
            return DataConnections;
        }

        public Logging GetLogging()
        {
            return Logging;
        }
    }
}
