using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Extensions.UtilityExtensions
{
    public static class IsNullExtension
    {
        public static bool IsNull(this object obj)
        {
            return obj == null;
        }

        public static bool IsNotNull(this object obj)
        {
            return !obj.IsNull();
        }
    }
}
