using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Services;
using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service.Services.Admin
{
    public class PlayerAdminService : IPlayerAdminService 
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public PlayerAdminService(IUnitOfWorkManager unitOfWorkManager)
        {
            _unitOfWorkManager = unitOfWorkManager;
        }

        public async Task<IEnumerable<PlayerModel>> GetPlayerAsync(PlayerAdminSearchModel request)
        {
            return await _unitOfWorkManager.ExecuteSingleAsync
                <IPlayerRepository, IEnumerable<PlayerModel>>
                (u => u.GetPlayers(request));
        }
    }
}
