using Paladins.Common.DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface ISeedService
    {
        Task<NonDataResult> SeedAsync();
    }
}
