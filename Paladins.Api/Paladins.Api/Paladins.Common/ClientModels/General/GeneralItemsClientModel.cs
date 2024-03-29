﻿using Newtonsoft.Json;
using System;

namespace Paladins.Common.ClientModels.General
{
    public partial class GeneralItemsClientModel : BaseClientModel
    {
        [JsonProperty("Description")]
        public string Description { get; set; }

        [JsonProperty("DeviceName")]
        public string DeviceName { get; set; }

        [JsonProperty("IconId")]
        public long IconId { get; set; }

        [JsonProperty("ItemId")]
        public long ItemId { get; set; }

        [JsonProperty("Price")]
        public long Price { get; set; }

        [JsonProperty("ShortDesc")]
        public string ShortDesc { get; set; }

        [JsonProperty("champion_id")]
        public long ChampionId { get; set; }

        [JsonProperty("itemIcon_URL")]
        public Uri ItemIconUrl { get; set; }

        [JsonProperty("item_type")]
        public string ItemType { get; set; }

        [JsonProperty("talent_reward_level")]
        public long TalentRewardLevel { get; set; }
    }
}
