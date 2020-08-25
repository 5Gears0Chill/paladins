namespace Paladins.Repository.SeedData.Data.Tier
{
    public class TierData : DataRoot
    {
        private const string data = "{\"tiers\":[{\"id\":1,\"name\":\"Bronze V\"},{\"id\":2,\"name\":\"Bronze IV\"},{\"id\":3,\"name\":\"Bronze III\"},{\"id\":4,\"name\":\"Bronze II\"},{\"id\":5,\"name\":\"Bronze I\"},{\"id\":6,\"name\":\"Silver V\"},{\"id\":7,\"name\":\"Silver IV\"},{\"id\":8,\"name\":\"Silver III\"},{\"id\":9,\"name\":\"Silver II\"},{\"id\":10,\"name\":\"Silver I\"},{\"id\":11,\"name\":\"Gold V\"},{\"id\":12,\"name\":\"Gold VI\"},{\"id\":13,\"name\":\"Gold III\"},{\"id\":14,\"name\":\"Gold II\"},{\"id\":15,\"name\":\"Gold I\"},{\"id\":16,\"name\":\"Platinum V\"},{\"id\":17,\"name\":\"Platinum VI\"},{\"id\":18,\"name\":\"Platinum III\"},{\"id\":19,\"name\":\"Platinum II\"},{\"id\":20,\"name\":\"Platinum I\"},{\"id\":21,\"name\":\"Diamond V\"},{\"id\":22,\"name\":\"Diamond VI\"},{\"id\":23,\"name\":\"Diamond III\"},{\"id\":24,\"name\":\"Diamond II\"},{\"id\":25,\"name\":\"Diamond I\"},{\"id\":26,\"name\":\"Masters I\"},{\"id\":27,\"name\":\"Grandmaster\"}]}";

        public string GetData()
        {
            return data;
        }

        public static TierData CreateInstance()
        {
            return new TierData();
        }
    }
}
