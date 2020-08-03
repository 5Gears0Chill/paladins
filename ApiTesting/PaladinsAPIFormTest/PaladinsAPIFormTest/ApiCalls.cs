using Nancy.Json;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Windows.Forms;

namespace PaladinsAPIFormTest
{
    public partial class Form1
    {
        string devKey = "3586"; // devKey goes here
        string authKey = "63E5B69A1D854AE293CD4EC96A477CE4";  // authKey goes here 
        string timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss");

        string urlPrefixPaladins = "http://api.paladins.com/paladinsapi.svc/";


        string signature = "";
        string session = "";

        public Form1()
        {
            InitializeComponents();
        }

        private static string GetMD5Hash(string input)
        {
            var md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            var bytes = System.Text.Encoding.UTF8.GetBytes(input);
            bytes = md5.ComputeHash(bytes);
            var sb = new System.Text.StringBuilder();
            foreach (byte b in bytes)
            {
                sb.Append(b.ToString("x2").ToLower());
            }
            return sb.ToString();
        }

        private void buttonCreateSession_Click(object sender, EventArgs e)
        {
            // Get Signature that is specific to "createsession"
            //
            signature = GetMD5Hash(devKey + "createsession" + authKey + timestamp);

            // Call the "createsession" API method & wait for synchronous response
            //
            WebRequest request = WebRequest.Create(urlPrefixPaladins + "createsessionjson/" + devKey + "/" + signature + "/" + timestamp);
            WebResponse response = request.GetResponse();

            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);

            string responseFromServer = reader.ReadToEnd();

            reader.Close();
            response.Close();

            // Parse returned JSON into "session" data
            //
            using (var web = new WebClient())
            {
                web.Encoding = System.Text.Encoding.UTF8;
                var jsonString = responseFromServer;
                var jss = new JavaScriptSerializer();
                var g = jss.Deserialize<SessionInfo>(jsonString);

                session = g.session_id;

                MessageBox.Show(session);
            }
        }

        private void buttonGetGods_Click(object sender, EventArgs e)
        {
            // Get Signature that is specific to "getgods"
            //
            signature = GetMD5Hash(devKey + "getchampions" + authKey + timestamp);


            // Call the "getgods" API method & wait for synchronous response
            //
            string languageCode = "1";

            WebRequest request = WebRequest.Create(urlPrefixPaladins + "getchampionsJson/" + devKey + "/" + signature + "/" + session + "/" + timestamp + "/" + languageCode);
            WebResponse response = request.GetResponse();

            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);

            string responseFromServer = reader.ReadToEnd();

            reader.Close();
            response.Close();

            // Parse returned JSON into "gods" data
            //
            using (var web = new WebClient())
            {
                web.Encoding = System.Text.Encoding.UTF8;
                var jsonString = responseFromServer;
                var jss = new JavaScriptSerializer();
                var GodsList = jss.Deserialize<List<Champions>>(jsonString);
                string GodsListStr = "";

                foreach (Champions x in GodsList)
                    GodsListStr = GodsListStr + ", " + x.Name;

                MessageBox.Show("Here are the Gods: " + GodsListStr + "/n");
            }

        }

        public class SessionInfo
        {
            public string ret_msg { get; set; }
            public string session_id { get; set; }
            public string timestamp { get; set; }

        }

        public class Menuitem
        {
            public string description { get; set; }
            public string value { get; set; }
        }

        public class Rankitem
        {
            public string description { get; set; }
            public string value { get; set; }
        }

        public class AbilityDescription
        {
            public string description { get; set; }
            public string secondaryDescription { get; set; }
            public List<Menuitem> menuitems { get; set; }
            public List<Rankitem> rankitems { get; set; }
            public string cooldown { get; set; }
            public string cost { get; set; }
        }
        public partial class Champions
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
            public Ability ChampionAbility1 { get; set; }

            [JsonProperty("Ability_2")]
            public Ability ChampionAbility2 { get; set; }

            [JsonProperty("Ability_3")]
            public Ability ChampionAbility3 { get; set; }

            [JsonProperty("Ability_4")]
            public Ability ChampionAbility4 { get; set; }

            [JsonProperty("Ability_5")]
            public Ability ChampionAbility5 { get; set; }

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

            [JsonProperty("ret_msg")]
            public object RetMsg { get; set; }
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
}
