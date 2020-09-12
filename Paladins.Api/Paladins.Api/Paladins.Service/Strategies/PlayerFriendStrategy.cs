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
    public class PlayerFriendStrategy : BasePlayerStrategy,
        IPlayerStrategy<PlayerBaseRequest, PlayerFriendsClientModel, FriendModel>
    {
        public PlayerFriendStrategy(IUnitOfWorkManager unitOfWorkManager,
            IPlayerClient playerClient,
            IMapper<PlayerClientModel, PlayerModel> playerMapper)
            : base(unitOfWorkManager: unitOfWorkManager, playerClient: playerClient, playerMapper: playerMapper)
        {
        }

        public async Task<IEnumerable<FriendModel>> Find()
        {
            var friends = await _unitOfWorkManager.ExecuteSingleAsync
                <IFriendRepository, IEnumerable<FriendModel>>
                (u => u.GetFriendsAsync(Player));
            return friends;
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

        public PlayerModel Populate(IList<PlayerFriendsClientModel> clientResponse)
        {
            Player.PopulateFriends(clientResponse);
            return Player;
        }

        public async Task<Response<PlayerModel>> Process(Response<PlayerModel> response, IEnumerable<FriendModel> friends)
        {
            if (friends.Any())
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync<IFriendRepository, DataListResult<FriendModel>>
                    (u => u.UpdateFriendsAsync(friends.ToList(), Player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.Friends = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Update friends");
                }
            }
            else
            {
                var storedResponse = await _unitOfWorkManager.ExecuteSingleAsync<IFriendRepository, DataListResult<FriendModel>>
                    (u => u.InsertFriendsAsync(Player.Friends, Player));
                if (storedResponse.IsSuccessful)
                {

                    response.Data.Friends = storedResponse.Data.ToList();
                }
                else
                {
                    response.ValidatonResults.ErrorMessages.Add("failed to Insert friends");
                }
            }
            return response;
        }
    }
}
