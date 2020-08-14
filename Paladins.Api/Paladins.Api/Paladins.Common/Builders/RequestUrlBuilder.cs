using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Builders
{
    public class RequestUrlBuilder : IRequestUrlBuilder
    {
        private readonly ISignatureBuilder _signatureBuilder;
        public RequestUrlBuilder(ISignatureBuilder signatureBuilder)
        {
            _signatureBuilder = signatureBuilder;
        }

        public string BuildSessionUrl()
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.SessionRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.SessionRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp);

            return sb.ToString();
        }

        public string BuildUsageStatisticsUrl(string sessionId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.UsageStatisticsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.UsageStatisticsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp);

            return sb.ToString();
        }
        public string BuildGetPlayerUrl(string sessionId, string playerName)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName);

            return sb.ToString();
        }

        public string BuildGetFriendsUrl(string sessionId, string playerName)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerFriendsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerFriendsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName);

            return sb.ToString();
        }

        public string BuildGetQueueStatsUrl(string sessionId, string playerName, string queue)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerQueueStatsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerQueueStatsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName)
                .Append(AsciiConstants.ForwardSlash)
                .Append(queue);

            return sb.ToString();
        }
        public string BuildGetPlayerStatusUrl(string sessionId, string playerName)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerStatusRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerStatusRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName);

            return sb.ToString();
        }



        public string BuildGetChampionRanksUrl(string sessionId, string playerName)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerChampionRanksRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerChampionRanksRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName);

            return sb.ToString();
        }

        public string BuildGetMatchHistoryUrl(string sessionId, string playerName)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerMatchHistoryRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerMatchHistoryRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName);

            return sb.ToString();
        }

        public string BuildGetPlayerLoadoutsUrl(string sessionId, string playerName, int languageId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetPlayerLoadoutsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetPlayerLoadoutsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(playerName)
                .Append(AsciiConstants.ForwardSlash)
                .Append(languageId);

            return sb.ToString();
        }

        public string BuildGetChampionUrl(string sessionId, int langaugeId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetChampionsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetChampionsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(langaugeId);

            return sb.ToString();
        }

        public string BuildGetChampionSkinsUrl(string sessionId, int langaugeId, int championId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetChampionSkinsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetChampionSkinsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(championId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(langaugeId);

            return sb.ToString();
        }

        public string BuildGetItemsUrl(string sessionId, int langaugeId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetItemsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetItemsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(langaugeId);

            return sb.ToString();
        }

        public string BuildMatchDetailsUrl(string sessionId, string matchId)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetMatchDetailsRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetMatchDetailsRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(matchId);

            return sb.ToString();
        }

        public string BuildMatchDetailsBatchUrl(string sessionId, List<string> matchIds)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetMatchDetailsBatchRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetMatchDetailsBatchRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(string.Join(AsciiConstants.Comma, matchIds));

            return sb.ToString();
        }

        public string BuildMatchIdsByQueueUrl(string sessionId, string queue, string date, string hour)
        {
            var sb = new StringBuilder();
            sb.Append(ApiConstants.BaseUrl)
                .Append(ApiConstants.GetMatchIdsByQueueRelativePath)
                .Append(ApiConstants.DevKey)
                .Append(AsciiConstants.ForwardSlash)
                .Append(_signatureBuilder.GenerateSignature(ApiConstants.GetMatchIdsByQueueRelativePath))
                .Append(AsciiConstants.ForwardSlash)
                .Append(sessionId)
                .Append(AsciiConstants.ForwardSlash)
                .Append(ApiConstants.TimeStamp)
                .Append(AsciiConstants.ForwardSlash)
                .Append(queue)
                .Append(AsciiConstants.ForwardSlash)
                .Append(date)
                .Append(AsciiConstants.ForwardSlash)
                .Append(hour);

            return sb.ToString();
        }
    }
}
