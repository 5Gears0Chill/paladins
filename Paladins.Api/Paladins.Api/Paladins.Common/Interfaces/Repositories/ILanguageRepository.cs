using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface ILanguageRepository : IRepositoryCore
    {
        Task<NonDataResult> InsertBaseLanguageOptionsAsync();
        Task<NonDataResult> ClearTableAsync();
    }
}
