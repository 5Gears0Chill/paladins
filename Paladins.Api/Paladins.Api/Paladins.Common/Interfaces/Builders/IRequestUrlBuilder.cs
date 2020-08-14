using Paladins.Common.Constants;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.Builders
{
    public interface IRequestUrlBuilder
    {
        string BuildSessionUrl();
        string BuildGetPlayerUrl(string sessionId, string playerName);
        string BuildUsageStatisticsUrl(string sessionId);
        string BuildGetFriendsUrl(string sessionId, string playerName);
        string BuildGetChampionRanksUrl(string sessionId, string playerName);
        string BuildGetChampionUrl(string sessionId, int langaugeId);
        string BuildGetChampionSkinsUrl(string sessionId, int langaugeId, int championId);
        string BuildGetItemsUrl(string sessionId, int langaugeId);
        string BuildMatchDetailsUrl(string sessionId, string matchId);
        string BuildMatchDetailsBatchUrl(string sessionId, List<string> matchIds);
        string BuildMatchIdsByQueueUrl(string sessionId, string queue, string date, string hour);
        string BuildGetMatchHistoryUrl(string sessionId, string playerName);
        string BuildGetPlayerLoadoutsUrl(string sessionId, string playerName, int languageId);
        string BuildGetPlayerStatusUrl(string sessionId, string playerName);
        string BuildGetQueueStatsUrl(string sessionId, string playerName, string queue);
    }
}
