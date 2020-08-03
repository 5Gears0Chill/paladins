using Nancy.Json;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;

namespace GenerateMD5
{
    class Program
    {
        static string devKey = "3586"; // devKey goes here
        static string authKey = "63E5B69A1D854AE293CD4EC96A477CE4";  // authKey goes here 
        static string timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss");

        static string url = "http://api.paladins.com/paladinsapi.svc/";
        static string languageCode = "1";

        private static string endpoint = "";
        private static string signature = "";
        private static string sessionId = "";

        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Enter the endpoint: must end with /");

                endpoint = Console.ReadLine();

                Console.WriteLine("Signature: ");
                Console.WriteLine(GenerateSignature("createsession"));
                string session = JsonConvert.SerializeObject(GenerateSynchronousSession(), Formatting.Indented);
                Console.WriteLine("Session Object:");
                Console.WriteLine(session);
                Console.WriteLine("Final API Call:");
                Console.WriteLine(GenerateAPICall());
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("Enter E for exit or anything for continue");

                var end = Console.ReadLine();
                if (end.ToLower().Trim().Equals("e"))
                {
                    timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss");
                    break;
                }
            }
        }


        private static string GenerateAPICall()
        {
            var call = url + endpoint + devKey + "/" + GetMD5Hash(endpoint) + "/" + sessionId + "/" + timestamp + "/" + languageCode;
            return call;
        }

        private static SessionInfo GenerateSynchronousSession()
        {
            WebRequest request = WebRequest.Create(url + "createsessionjson/" + devKey + "/" + signature + "/" + timestamp);
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
                sessionId = g.session_id;
                return g;
            }
        }

        private static string GenerateSignature(string inputSession)
        {
            signature = GetMD5Hash(inputSession);
            return signature;
        }
        private static string GetMD5Hash(string inputSession)
        {
            var input = GenerateInput(inputSession);
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

        private static string GenerateInput(string inputApi)
        {
            if (inputApi.Contains("Json/"))
            {
                inputApi = inputApi.Substring(0,inputApi.Length - 5);
            }
            var str = devKey + inputApi + authKey + timestamp;
            return str ;
        }
    }

    public class SessionInfo
    {
        public string ret_msg { get; set; }
        public string session_id { get; set; }
        public string timestamp { get; set; }

    }

}
