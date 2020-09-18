using Paladins.Common.ClientModels.Player;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.DataAccess;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Interfaces.Strategies;
using Paladins.Common.Models;
using Paladins.Common.Requests;
using Paladins.Common.Responses;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Service.Strategies
{
    public class PlayerLoadoutStrategy : BasePlayerStrategy,
        IPlayerStrategy<PlayerLoadoutsRequest, PlayerLoadoutsClientModel, PlayerLoadoutModel>
    {
        public PlayerLoadoutStrategy(IUnitOfWorkManager unitOfWorkManager,
            IPlayerClient playerClient,
            IMapper<PlayerClientModel, PlayerModel> playerMapper)
            : base(unitOfWorkManager: unitOfWorkManager, playerClient: playerClient, playerMapper: playerMapper)
        {
        }

        public async Task<IEnumerable<PlayerLoadoutModel>> Find()
        {
            var loadouts = await _unitOfWorkManager.ExecuteSingleAsync
              <ILoadoutRepository, IEnumerable<PlayerLoadoutModel>>
              (u => u.GetPlayerLoadoutAsync(Player));
            return loadouts;
        }

        public async Task<Response<PlayerModel>> Get(PlayerLoadoutsRequest request)
        {
            var response = new Response<PlayerModel>();
            Player = await _unitOfWorkManager
             .ExecuteSingleAsync<IPlayerRepository, PlayerModel>(u => u.GetPlayerByPlayerName(request.PlayerName));
            if (Player.IsNull())
            {
                var storedResult = await GetPlayerAsync(request);
                Player = storedResult.Data;
            }
            response.Data = Player;
            return response;
        }

        public PlayerModel Populate(IList<PlayerLoadoutsClientModel> clientResponse)
        {
            Player.PopulateLoadouts(clientResponse);
            return Player;
        }

        public async Task<Response<PlayerModel>> Process(Response<PlayerModel> response, IEnumerable<PlayerLoadoutModel> loadouts)
        {
            if (loadouts.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <ILoadoutRepository, DataListResult<PlayerLoadoutModel>>
                    (u => u.UpdatePlayerLoadoutAsync(loadouts.ToList()));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.Loadouts = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidationResults.ErrorMessages.Add("failed to Update Loadouts");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <ILoadoutRepository, DataListResult<PlayerLoadoutModel>>
                    (u => u.InsertPlayerLoadoutAsync(Player.Loadouts));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.Loadouts = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidationResults.ErrorMessages.Add("failed to Insert Loadouts");
                }
            }
            return response;
        }
    }
}
