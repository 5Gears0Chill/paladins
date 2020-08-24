using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers
{
    public interface IMapper<TFrom,TDestination>
    {
        TDestination Map(TFrom from);
    }
}
