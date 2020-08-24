using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.SeedData.Data.Language
{
    public class LanguageData : DataRoot
    {
        private const string data = "{  \"languages\": [    {      \"id\": 1,      \"name\": \"English\"    },    {      \"id\": 2,      \"name\": \"German\"    },    {      \"id\": 3,      \"name\": \"French\"    },    {      \"id\": 5,      \"name\": \"Chinese\"    },    {      \"id\": 7,      \"name\": \"Spanish\"    },    {      \"id\": 9,      \"name\": \"Spanish (Latin America)\"    },    {      \"id\": 10,      \"name\": \"Portuguese\"    },    {      \"id\": 11,      \"name\": \"Russian\"    },    {      \"id\": 12,      \"name\": \"Polish\"    },    {      \"id\": 13,      \"name\": \"Turkish\"    }  ]}";

        public string GetData()
        {
            return data;
        }

        public static LanguageData CreateInstance()
        {
            return new LanguageData();
        }
    }
}
