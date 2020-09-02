using Paladins.Common.Constants;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Paladins.Common.Requests
{
    public class ChampionSkinsRequest : GeneralBaseRequest
    {
        [Required]
        public int ChampionId { get; set; }

        public static ChampionSkinsRequest CreateInstance(string sessionId, int championId)
        {
            return new ChampionSkinsRequest
            {
                SessionId = sessionId,
                ChampionId = championId,
                LanguageId = (int)LanguageEnum.English,
            };
        }
    }
}
