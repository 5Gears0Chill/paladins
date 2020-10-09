using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Paladins.Common.Extensions.UtilityExtensions
{
    public static class StringExtensions
    {
        public static bool ContainsAny(this string input, IEnumerable<string> containsKeywords, StringComparison comparisonType)
        {
            return containsKeywords.Any(keyword => input.IndexOf(keyword, comparisonType) >= 0);
        }
        public static bool IsNullOrWhiteSpace(this string s)
        {
            return string.IsNullOrWhiteSpace(s);
        }
    }
}
