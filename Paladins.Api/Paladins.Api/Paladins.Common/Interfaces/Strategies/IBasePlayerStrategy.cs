using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Strategies
{
    public interface IBasePlayerStrategy
    {
        Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request);
    }
}
