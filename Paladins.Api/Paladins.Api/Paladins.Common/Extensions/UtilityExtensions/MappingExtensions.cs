using Paladins.Common.ClientModels.Match;

namespace Paladins.Common.Extensions.UtilityExtensions
{
    public static class MappingExtensions
    {

        public static bool IsRankedMatch(this MatchDetailsClientModel model)
        {
            if(model.Ban1.IsNull() || model.Ban2.IsNull() || model.Ban3.IsNull() || model.Ban4.IsNull())
            {
                return false;
            }
            return true;
        }

        public static bool IsNotRankedMatch(this MatchDetailsClientModel model)
        {
            return !IsRankedMatch(model);
        }
    }
}
