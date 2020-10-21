using System;
using System.Linq;
using System.Linq.Expressions;

namespace Paladins.Common.Extensions.LinqExtensions
{
    public static class ConditionalExtensions
    {
        public static IQueryable<T> ConditionalWhere<T>(this IQueryable<T> source, Func<bool> condition, Expression<Func<T, bool>> predicate)
        {
            if (condition())
            {
                return source.Where(predicate);
            }

            return source;
        }


        public static IQueryable<T> ConditionalBetween<T>(this IQueryable<T> source, Func<bool> firstCondition, Func<bool> secondCondition, Expression<Func<T, bool>> predicate)
        {
            if (firstCondition() && secondCondition())
            {
                return source.Where(predicate);
            }

            return source;
        }
    }
}
