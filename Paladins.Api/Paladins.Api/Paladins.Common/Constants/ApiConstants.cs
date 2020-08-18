using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Constants
{
    public static class ApiConstants
    {
        /// <summary>
        /// Development Variables
        /// </summary>
        public const string BaseUrl = "http://api.paladins.com/paladinsapi.svc/";
        public const string DevKey = "3586";
        public const string AuthKey = "63E5B69A1D854AE293CD4EC96A477CE4";

        /// <summary>
        /// Common Variables
        /// </summary>
        public static string TimeStamp()
        {
            return DateTime.UtcNow.ToString("yyyyMMddHHmmss");
        }
        /// <summary>
        /// Session Variables
        /// </summary>
        public const string SessionRelativePath = "createsessionJson/";
        public const string UsageStatisticsRelativePath = "getdatausedJson/";

        /// <summary>
        /// Player Variables
        /// </summary>
        public const string GetPlayerRelativePath = "getplayerJson/";
        public const string GetPlayerFriendsRelativePath = "getfriendsJson/";
        public const string GetPlayerChampionRanksRelativePath = "getchampionranksJson/";
        public const string GetPlayerMatchHistoryRelativePath = "getmatchhistoryJson/";
        public const string GetPlayerLoadoutsRelativePath = "getplayerloadoutsJson/";
        public const string GetPlayerStatusRelativePath = "getplayerstatusJson/";
        public const string GetPlayerQueueStatsRelativePath = "getqueuestatsJson/";


        /// <summary>
        /// General Variables
        /// </summary>
        public const string GetChampionsRelativePath = "getchampionsJson/";
        public const string GetChampionSkinsRelativePath = "getchampionskinsJson/";
        public const string GetItemsRelativePath = "getitemsJson/";

        /// <summary>
        /// Match Variables
        /// </summary>
        public const string GetMatchDetailsRelativePath = "getmatchdetailsJson/";
        public const string GetMatchDetailsBatchRelativePath = "getmatchdetailsbatchJson/";
        public const string GetMatchIdsByQueueRelativePath = "getmatchidsbyqueueJson/";


    }
}
