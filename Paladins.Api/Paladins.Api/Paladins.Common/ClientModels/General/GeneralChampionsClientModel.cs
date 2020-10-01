using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels.General
{
    public partial class GeneralChampionsClientModel : BaseClientModel
    {
        [JsonProperty("Ability1")]
        public string Ability1 { get; set; }

        [JsonProperty("Ability2")]
        public string Ability2 { get; set; }

        [JsonProperty("Ability3")]
        public string Ability3 { get; set; }

        [JsonProperty("Ability4")]
        public string Ability4 { get; set; }

        [JsonProperty("Ability5")]
        public string Ability5 { get; set; }

        [JsonProperty("AbilityId1")]
        public long AbilityId1 { get; set; }

        [JsonProperty("AbilityId2")]
        public long AbilityId2 { get; set; }

        [JsonProperty("AbilityId3")]
        public long AbilityId3 { get; set; }

        [JsonProperty("AbilityId4")]
        public long AbilityId4 { get; set; }

        [JsonProperty("AbilityId5")]
        public long AbilityId5 { get; set; }

        [JsonProperty("Ability_1")]
        public Ability GeneralChampionsClientModelAbility1 { get; set; }

        [JsonProperty("Ability_2")]
        public Ability GeneralChampionsClientModelAbility2 { get; set; }

        [JsonProperty("Ability_3")]
        public Ability GeneralChampionsClientModelAbility3 { get; set; }

        [JsonProperty("Ability_4")]
        public Ability GeneralChampionsClientModelAbility4 { get; set; }

        [JsonProperty("Ability_5")]
        public Ability GeneralChampionsClientModelAbility5 { get; set; }

        [JsonProperty("ChampionAbility1_URL")]
        public Uri ChampionAbility1Url { get; set; }

        [JsonProperty("ChampionAbility2_URL")]
        public Uri ChampionAbility2Url { get; set; }

        [JsonProperty("ChampionAbility3_URL")]
        public Uri ChampionAbility3Url { get; set; }

        [JsonProperty("ChampionAbility4_URL")]
        public Uri ChampionAbility4Url { get; set; }

        [JsonProperty("ChampionAbility5_URL")]
        public Uri ChampionAbility5Url { get; set; }

        [JsonProperty("ChampionCard_URL")]
        public string ChampionCardUrl { get; set; }

        [JsonProperty("ChampionIcon_URL")]
        public Uri ChampionIconUrl { get; set; }

        [JsonProperty("Cons")]
        public string Cons { get; set; }

        [JsonProperty("Health")]
        public long Health { get; set; }

        [JsonProperty("Lore")]
        public string Lore { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("OnFreeRotation")]
        public string OnFreeRotation { get; set; }

        [JsonProperty("Pantheon")]
        public string Pantheon { get; set; }

        [JsonProperty("Pros")]
        public string Pros { get; set; }

        [JsonProperty("Roles")]
        public string Roles { get; set; }

        [JsonProperty("Speed")]
        public long Speed { get; set; }

        [JsonProperty("Title")]
        public string Title { get; set; }

        [JsonProperty("Type")]
        public string Type { get; set; }

        [JsonProperty("abilityDescription1")]
        public string AbilityDescription1 { get; set; }

        [JsonProperty("abilityDescription2")]
        public string AbilityDescription2 { get; set; }

        [JsonProperty("abilityDescription3")]
        public string AbilityDescription3 { get; set; }

        [JsonProperty("abilityDescription4")]
        public string AbilityDescription4 { get; set; }

        [JsonProperty("abilityDescription5")]
        public string AbilityDescription5 { get; set; }

        [JsonProperty("id")]
        public long Id { get; set; }

        [JsonProperty("latestChampion")]
        public string LatestChampion { get; set; }
    }

    public partial class Ability
    {
        [JsonProperty("Description")]
        public string Description { get; set; }

        [JsonProperty("Id")]
        public long Id { get; set; }

        [JsonProperty("Summary")]
        public string Summary { get; set; }

        [JsonProperty("URL")]
        public Uri Url { get; set; }
    }
}
