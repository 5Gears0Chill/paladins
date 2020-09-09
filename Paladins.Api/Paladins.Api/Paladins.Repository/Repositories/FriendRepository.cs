using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class FriendRepository : Repository<PaladinsDbContext>, IFriendRepository
    {
        IMapper<FriendModel, Friend> _mapper;
        public FriendRepository(IAuditManager auditManager,
             IMapper<FriendModel, Friend> mapper)
            : base(auditManager)
        {
            _mapper = mapper;
        }

        public async Task<DataListResult<FriendModel>> InsertFriendsAsync(List<FriendModel> model, PlayerModel player)
        {
            var friends = model.Select(x => _mapper.Map(x)).Select(x => new Friend 
            {
                AccountId = x.AccountId,
                Name = x.Name,
                PlayerId = player.PlayerId,
                PplayerId = x.PplayerId,
            });
            var response = await InsertListAsync(friends);
            return new DataListResult<FriendModel>(response.RowsAffected, model);
        }

        public async Task<IEnumerable<FriendModel>> GetFriendsAsync(PlayerModel player)
        {
            var response = await Context
                .Friend
                .Where(x => x.PlayerId == player.PlayerId)
                .Select(x => new FriendModel
                    {
                        Id = x.Id,
                        Name = x.Name,
                        PaladinsPlayerId = x.PplayerId,
                        AccountId = x.AccountId,
                        CreatedOn = x.CreatedOn,
                        LastUpdatedOn = x.LastUpdatedOn
                    })
                .ToListAsync();
            return response;
        }

        public async Task<DataListResult<FriendModel>> UpdateFriendsAsync(List<FriendModel> model, PlayerModel player)
        {
            var friends = model.Select(x => _mapper.Map(x)).Select(x => new Friend
            {
                Id = x.Id,
                AccountId = x.AccountId,
                Name = x.Name,
                PlayerId = player.PlayerId,
                PplayerId = x.PplayerId,
                CreatedOn = x.CreatedOn,
                LastUpdatedOn = x.LastUpdatedOn,
            });

            var response = await UpdateListAsync(friends);
            return new DataListResult<FriendModel>(response.RowsAffected, model);
        }
    }
}
