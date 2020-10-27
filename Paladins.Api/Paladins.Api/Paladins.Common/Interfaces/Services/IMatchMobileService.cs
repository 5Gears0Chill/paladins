using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Services
{
    public interface IMatchMobileService
    {
        Task<Response<IEnumerable<MatchDetailsModel>>> GetMatchDetailsAsync(MatchBaseRequest request);
    }
}
