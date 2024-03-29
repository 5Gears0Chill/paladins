﻿using Microsoft.EntityFrameworkCore;
using Paladins.Common.Auditing;
using Paladins.Common.DataAccess.Models;
using Paladins.Common.DataAccess.Patterns;
using Paladins.Common.Extensions.LinqExtensions;
using Paladins.Common.Extensions.UtilityExtensions;
using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Interfaces.Repositories;
using Paladins.Common.Models;
using Paladins.Common.Requests.Admin;
using Paladins.Repository.DbContexts;
using Paladins.Repository.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paladins.Repository.Repositories
{
    public class PlayerRepository: Repository<PaladinsDbContext>, IPlayerRepository
    {
        private readonly IMapper<PlayerModel, Player> _modelToPlayerMapper;
        private readonly IMapper<Player, PlayerModel> _playerToModelMapper;
        public PlayerRepository(IAuditManager auditManager,
            IMapper<PlayerModel, Player> modelToPlayerMapper,
            IMapper<Player, PlayerModel> playerToModelMapper)
            :base(auditManager)
        {

            _modelToPlayerMapper = modelToPlayerMapper;
            _playerToModelMapper = playerToModelMapper;
        }

        public async Task<DataResult<PlayerModel>> InsertNewPlayerAsync(PlayerModel model)
        {
            var response = await SaveAsync(_modelToPlayerMapper.Map(model));
            if (response.IsSuccessful)
            {
                model.PlayerId = response.Data.Id;
            }
            return new DataResult<PlayerModel>(response.RowsAffected, model);
        }

        public async Task<PlayerModel> GetPlayerByPaladinsPlayerId(int paladinsPlayerId)
        {
            var response = await Context.Player
                .Where(x => x.PplayerId == paladinsPlayerId)
                .FirstOrDefaultAsync();
            if(response.IsNull())
            {
                //new entry
                return null;
            }
            //exists
            return _playerToModelMapper.Map(response); 
        }

        public async Task<PlayerModel> GetPlayerByPlayerName(string playerName)
        {
            var response = await Context.Player
                .Where(x => x.Name == playerName)
                .FirstOrDefaultAsync();
            if (response.IsNull())
            {
                //new entry
                return null;
            }
            //exists
            return _playerToModelMapper.Map(response);
        }

        public async Task<DataResult<PlayerModel>> UpdatePlayerAsync(PlayerModel model)
        {
            var entity = _modelToPlayerMapper.Map(model);
            foreach(var rankDetails in entity.PlayerRankDetails)
            {
                _auditManager.SetUpdateAudit(rankDetails);
            }
            var response = await SaveAsync(entity);
            if (response.IsSuccessful)
            {
                model.PlayerId = response.Data.Id;
            }
            return new DataResult<PlayerModel>(response.RowsAffected, model);
        }

        public async Task<IEnumerable<PlayerModel>> GetPlayers(PlayerAdminSearchModel request)
        {
           return await Context.Player
                .ConditionalWhere(() => request.PlayerName.IsNotNull(), x => x.Name == request.PlayerName)
                .OrderByDescending(x => x.Id)
                .Select(x => _playerToModelMapper.Map(x))
                .ToListAsync();  
        }
    }
}
