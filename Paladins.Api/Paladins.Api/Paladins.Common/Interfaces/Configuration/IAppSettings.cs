using Paladins.Common.Configuration;
namespace Paladins.Common.Interfaces.Configuration
{
    public interface IAppSettings
    {
        DataConnections GetDataConnections();
        Logging GetLogging();
    }
}
