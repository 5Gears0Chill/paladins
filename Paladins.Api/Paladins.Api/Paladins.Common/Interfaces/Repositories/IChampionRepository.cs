using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IChampionRepository : IRepositoryCore
    {
        Task<NonDataResult> InsertChampionsAsync(IEnumerable<ChampionModel> champions);
    }
}
