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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Service.Strategies
{
    public class PlayerChampionStatsStrategy : BasePlayerStrategy,
        IPlayerStrategy<PlayerBaseRequest, PlayerChampionRanksClientModel, PlayerChampionStatsModel>
    {
        public PlayerChampionStatsStrategy(IUnitOfWorkManager unitOfWorkManager,
            IPlayerClient playerClient,
            IMapper<PlayerClientModel, PlayerModel> playerMapper)
            : base(unitOfWorkManager: unitOfWorkManager, playerClient: playerClient, playerMapper: playerMapper)
        {
        }

        public async Task<IEnumerable<PlayerChampionStatsModel>> Find()
        {
            var championStats = await _unitOfWorkManager.ExecuteSingleAsync
                <IChampionRepository, IEnumerable<PlayerChampionStatsModel>>
                (u => u.GetPlayerChampionStatsAsync(Player));
            return championStats;
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

        public PlayerModel Populate(IList<PlayerChampionRanksClientModel> clientResponse)
        {
            Player.PopulateChampionStats(clientResponse);
            return Player;
        }

        public async Task<Response<PlayerModel>> Process(Response<PlayerModel> response, IEnumerable<PlayerChampionStatsModel> championStats)
        {
            if (championStats.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <IChampionRepository, DataListResult<PlayerChampionStatsModel>>
                    (u => u.UpdatePlayerChampionStatsAsync(championStats.ToList(), Player));
                if (storedResponse.IsSuccessful)
                {
                    response.Data.ChampionStats = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidationResults.ErrorMessages.Add("failed to Update Champion Stats");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync
                    <IChampionRepository, DataListResult<PlayerChampionStatsModel>>
                    (u => u.InsertPlayerChampionStatsAsync(Player.ChampionStats, Player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.ChampionStats = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidationResults.ErrorMessages.Add("failed to Insert Champion Stats");
                }
            }
            return response;
        }
    }
}
