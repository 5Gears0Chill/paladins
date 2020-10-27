using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;

namespace Paladins.Common.Interfaces.Resolvers
{
    /// <summary>
    /// Converts requests from controllers to accomodate different services
    /// </summary>
    public interface IControllerRequestResolver
    {
        PlayerBaseRequest CreateBasePlayerRequest(PlayerControllerRequest request);
        PlayerBaseRequest CreateBasePlayerRequest(PlayerPagedRequest request);
        PlayerLoadoutsRequest CreatePlayerLoadoutsRequest(PlayerControllerLoadoutRequest request);
        PlayerLoadoutsRequest CreatePlayerLoadoutsRequest(PlayerPagedRequest request);
        PlayerQueueStatsRequest CreatePlayerQueueStatsRequest(PlayerControllerQueueStatsRequest request);
        MatchBaseRequest CreateBaseMatchRequest(MatchControllerRequest request);
        MatchBaseRequest CreateBaseMatchRequest(MatchNonLinkedRequest request);
    }
}
