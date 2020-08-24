using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.SeedData.Data.Queue
{
    public class QueueData : DataRoot
    {
        private const string data = "{\"queues\":[{\"id\":424,\"name\":\"LIVESiege\"},{\"id\":425,\"name\":\"LIVEPracticeSiege\"},{\"id\":426,\"name\":\"LIVECompetitive\"},{\"id\":445,\"name\":\"LIVETestMaps\"},{\"id\":452,\"name\":\"LIVEOnslaught\"},{\"id\":453,\"name\":\"LIVEOnslaughtPractice\"},{\"id\":465,\"name\":\"ClassicSiege\"},{\"id\":469,\"name\":\"LIVETeamDeathmatch\"},{\"id\":470,\"name\":\"LIVETeamDeathmatchPractice\"},{\"id\":468,\"name\":\"CustomTeamDeathmatchTradeDistrict\"},{\"id\":471,\"name\":\"CustomTeamDeathmatchForeman'sRise\"},{\"id\":472,\"name\":\"CustomTeamDeathmatchMagistrate'sArchives\"},{\"id\":423,\"name\":\"CustomSiegeStoneKeep\"},{\"id\":430,\"name\":\"CustomSiegeTimberMill\"},{\"id\":431,\"name\":\"CustomSiegeFishMarket\"},{\"id\":432,\"name\":\"CustomSiegeFrozenGuard\"},{\"id\":433,\"name\":\"CustomSiegeFrogIsle\"},{\"id\":438,\"name\":\"CustomSiegeJaguarFalls\"},{\"id\":439,\"name\":\"CustomSiegeIceMines\"},{\"id\":440,\"name\":\"CustomSiegeSerpentBeach\"},{\"id\":458,\"name\":\"CustomSiegeBrightmarsh\"},{\"id\":459,\"name\":\"CustomSiegeSplitstoneQuarry\"},{\"id\":454,\"name\":\"CustomOnslaughtSnowfallJunction\"},{\"id\":455,\"name\":\"CustomOnslaughtPrimalCourt\"}]}";

        public string GetData()
        {
            return data;
        }

        public static QueueData CreateInstance()
        {
            return new QueueData();
        }
    }
}
