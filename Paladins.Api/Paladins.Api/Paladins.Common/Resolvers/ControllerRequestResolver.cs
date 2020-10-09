using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Resolvers;
using Paladins.Common.Requests;
using Paladins.Common.Requests.Controllers;

namespace Paladins.Common.Resolvers
{
    public class ControllerRequestResolver : IControllerRequestResolver
    {
        public MatchBaseRequest CreateBaseMatchRequest(MatchControllerRequest request)
        {
            return new MatchBaseRequest
            {
                MatchId = request.MatchId,
                PlayerMatchHistoryId = request.PlayerMatchHistoryId
            };
        }

        public PlayerBaseRequest CreateBasePlayerRequest(PlayerControllerRequest request)
        {
            return new PlayerBaseRequest
            {
                PlayerName = request.PlayerName
            };
        }

        public PlayerBaseRequest CreateBasePlayerRequest(PlayerPagedRequest request)
        {
            return new PlayerBaseRequest
            {
                PlayerName = request.PlayerName
            };
        }

        public PlayerLoadoutsRequest CreatePlayerLoadoutsRequest(PlayerControllerLoadoutRequest request)
        {
            return new PlayerLoadoutsRequest
            {
                PlayerName = request.PlayerName,
                LanguageId = request.LanguageId,
            };
        }

        public PlayerLoadoutsRequest CreatePlayerLoadoutsRequest(PlayerPagedRequest request)
        {
            return new PlayerLoadoutsRequest
            {
                PlayerName = request.PlayerName,
                LanguageId = (int)LanguageEnum.English,
            };
        }

        public PlayerQueueStatsRequest CreatePlayerQueueStatsRequest(PlayerControllerQueueStatsRequest request)
        {
            return new PlayerQueueStatsRequest
            {
                PlayerName = request.PlayerName,
                QueueId = request.QueueId
            };
        }
    }
}
