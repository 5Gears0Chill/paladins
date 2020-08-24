using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers.Languages
{
    public interface ILanguageMapper
    {
        IEnumerable<Language> MapEnumerable();
    }
}
