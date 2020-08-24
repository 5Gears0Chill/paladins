using Paladins.Common.DataAccess.Models;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface ILanguageRepository
    {
        Task<NonDataResult> InsertBaseLanguageOptionsAsync();
        Task<NonDataResult> ClearTableAsync();
    }
}
