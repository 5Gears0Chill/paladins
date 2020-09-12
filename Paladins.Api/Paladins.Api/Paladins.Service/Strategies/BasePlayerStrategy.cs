using Paladins.Common.ClientModels.Player;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Service.Strategies
{
    public class BasePlayerStrategy
    {
        public IUnitOfWorkManager _unitOfWorkManager { get; private set; }
        public PlayerModel Player { get; set; }


        private readonly IPlayerClient _playerClient;
        private readonly IMapper<PlayerClientModel, PlayerModel> _playerMapper;
       

        public BasePlayerStrategy(IUnitOfWorkManager unitOfWorkManager,
            IPlayerClient playerClient, 
            IMapper<PlayerClientModel, PlayerModel> playerMapper)
        {
            _unitOfWorkManager = unitOfWorkManager;
            _playerClient = playerClient;
            _playerMapper = playerMapper;
        }

        public async Task<Response<PlayerModel>> GetPlayerAsync(PlayerBaseRequest request)
        {
            var response = await _playerClient.GetClientPlayerAsync(request);
            Player = await StorePlayerDataAsync(response.FirstOrDefault());
            return new Response<PlayerModel>() { Data = Player };
        }

        private async Task<PlayerModel> StorePlayerDataAsync(PlayerClientModel playerData)
        {
            if (playerData.IsNull())
            {
                return null;
            }

            var model = _playerMapper.Map(playerData);

            var player = await _unitOfWorkManager
                .ExecuteSingleAsync<IPlayerRepository, PlayerModel>
                (u => u.GetPlayerByPaladinsPlayerId(model.PaladinsPlayerId));
            if (player.IsNull())
            {
                var response = await _unitOfWorkManager
                .ExecuteSingleAsync<IPlayerRepository, DataResult<PlayerModel>>
                (u => u.InsertNewPlayerAsync(model));
                if (response.IsSuccessful)
                {
                    return response.Data;
                }
            }
            else
            {
                model.PlayerId = player.PlayerId;
                model.LastUpdatedOn = player.LastUpdatedOn;
                model.CreatedOn = player.CreatedOn;
                model.IsActive = player.IsActive;
                var response = await _unitOfWorkManager
                    .ExecuteSingleAsync<IPlayerRepository, DataResult<PlayerModel>>
                    (u => u.UpdatePlayerAsync(model));
                if (response.IsSuccessful)
                {
                    return response.Data;
                }
            }
            return null;
        }
    }
}
