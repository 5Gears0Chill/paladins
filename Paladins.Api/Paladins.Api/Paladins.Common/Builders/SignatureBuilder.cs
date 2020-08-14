using Paladins.Common.Constants;
using Paladins.Common.Interfaces.Builders;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Paladins.Client.Session
{
    public class SignatureBuilder : ISignatureBuilder
    {
        private static string GenerateMD5Hash(string relativePath)
        {
            var input = GenerateInput(relativePath);
            var md5 = new MD5CryptoServiceProvider();
            var bytes = Encoding.UTF8.GetBytes(input);
            bytes = md5.ComputeHash(bytes);
            var sb = new StringBuilder();
            foreach (byte b in bytes)
            {
                sb.Append(b.ToString("x2").ToLower());
            }
            return sb.ToString();
        }

        private static string GenerateInput(string relativePath)
        {
            if (relativePath.Contains("Json/"))
            {
                relativePath = relativePath[0..^5];
            }
            var str = ApiConstants.DevKey + relativePath + ApiConstants.AuthKey + ApiConstants.TimeStamp;
            return str;
        }

        public string GenerateSignature(string relativePath)
        {
            return GenerateMD5Hash(relativePath);
        }
    }
}
