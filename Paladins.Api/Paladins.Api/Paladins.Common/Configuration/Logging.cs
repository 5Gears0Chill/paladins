using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Configuration
{
    public class Logging
    {
        public Logging(LogLevel logLevel)
        {
            LogLevel = logLevel;
        }
        public LogLevel LogLevel { get; private set; }

        public static Logging CreateInstance(LogLevel logLevel)
        {
            return new Logging(logLevel);
        }
    }
}
