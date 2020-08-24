using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.SeedData.Models.Language
{
    public class RootLanguage : IRootBase
    {
        public List<LanguageSeedData> Languages { get; set; }
    }
}
