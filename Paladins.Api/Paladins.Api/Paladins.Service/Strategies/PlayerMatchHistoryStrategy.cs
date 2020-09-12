using Paladins.Common.ClientModels.Match;
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
    public class PlayerMatchHistoryStrategy : BasePlayerStrategy, 
        IPlayerStrategy<PlayerBaseRequest, MatchDetailsClientModel, PlayerMatchHistoryModel>
    {
        
        public PlayerMatchHistoryStrategy(IUnitOfWorkManager unitOfWorkManager, 
            IPlayerClient playerClient, 
            IMapper<PlayerClientModel, PlayerModel> playerMapper)
            :base(unitOfWorkManager: unitOfWorkManager,playerClient: playerClient, playerMapper: playerMapper)
        {
        }

        public async Task<Response<PlayerModel>> Get(PlayerBaseRequest request)
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

        public PlayerModel Populate(IList<MatchDetailsClientModel> clientResponse)
        {
            Player.PopulateMatchHistory(clientResponse);
            return Player;
        }

        public async Task<IEnumerable<PlayerMatchHistoryModel>> Find()
        {
            var matchHistories = await _unitOfWorkManager.ExecuteSingleAsync<IMatchHistoryRepository, IEnumerable<PlayerMatchHistoryModel>>
                (u => u.GetPlayerMatchHistories(Player));
            return matchHistories;
        }

        public async Task<Response<PlayerModel>> Process(Response<PlayerModel> response, IEnumerable<PlayerMatchHistoryModel> matchHistories)
        {
            if (matchHistories.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                   <IMatchHistoryRepository, DataListResult<PlayerMatchHistoryModel>>
                   (u => u.UpdatePlayerMatchHistoryAsync(matchHistories.ToList(), Player));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.MatchHistories = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update Match Histories");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                   <IMatchHistoryRepository, DataListResult<PlayerMatchHistoryModel>>
                   (u => u.InsertPlayerMatchHistoryAsync(Player.MatchHistories, Player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.MatchHistories = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert Champion Stats");
                }
            }
            return response;
        }

       
    }
}
