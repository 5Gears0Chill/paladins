using Paladins.Repository.Entities;
using Paladins.Repository.SeedData.Data.Language;
using Paladins.Repository.SeedData.Models.Language;
using System.Collections.Generic;
using System.Linq;

namespace Paladins.Repository.Mappers.Languages
{
    public class LanguageMapper : MapperBase<RootLanguage>, ILanguageMapper
    {
        public IEnumerable<Language> MapEnumerable ()
        {
            var from = LoadJson(LanguageData.CreateInstance());
            
            return from.Languages.Select(l => new Language
            {
                Name = l.Name,
                PlanguageId = l.Id
            });
        }
    }
}
