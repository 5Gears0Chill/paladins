using Paladins.Common.DataAccess.Models;
using Paladins.Common.Interfaces.Repositories.Base;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Repositories
{
    public interface IMatchDetailsRepository : IRepositoryCore
    {
        Task<IEnumerable<MatchDetailsModel>> GetMatchDetails(MatchBaseRequest request);
        Task<DataListResult<MatchDetailsModel>> InsertMatchDetailsEntry(IEnumerable<MatchDetailsModel> model, MatchBaseRequest request);
    }
}
