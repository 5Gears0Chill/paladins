using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers.Tiers
{
    public interface ITierMapper
    {
        IEnumerable<Tier> MapEnumerable();
    }
}
