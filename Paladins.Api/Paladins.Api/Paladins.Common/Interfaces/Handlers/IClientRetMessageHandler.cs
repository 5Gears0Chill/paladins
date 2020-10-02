using Paladins.Common.ClientModels;

namespace Paladins.Common.Interfaces.Handlers
{
    public interface IClientRetMessageHandler
    {
        TClientResponse HandleRetMessage<TClientResponse>(TClientResponse response) where TClientResponse : BaseClientModel;
    }
}
