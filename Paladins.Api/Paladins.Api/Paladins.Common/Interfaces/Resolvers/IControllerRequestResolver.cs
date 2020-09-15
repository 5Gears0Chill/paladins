using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;

namespace Paladins.Common.Interfaces.Resolvers
{
    public interface IControllerRequestResolver
    {
        PlayerBaseRequest CreateBasePlayerRequest(PlayerControllerRequest request);
        PlayerLoadoutsRequest CreatePlayerLoadoutsRequest(PlayerControllerLoadoutRequest request);
        PlayerQueueStatsRequest CreatePlayerQueueStatsRequest(PlayerControllerQueueStatsRequest request);
    }
}
