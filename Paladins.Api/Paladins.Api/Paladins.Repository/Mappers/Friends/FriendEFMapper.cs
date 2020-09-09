using Paladins.Common.Interfaces.Mappers;
using Paladins.Common.Models;
using Paladins.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Repository.Mappers.Friends
{
    public class FriendEFMapper : IMapper<FriendModel, Friend>
    {
        public Friend Map(FriendModel from)
        {
            return new Friend
            {
                Id = from.Id,
                Name = from.Name,
                PplayerId = from.PaladinsPlayerId,
                AccountId = from.AccountId,
                CreatedOn = from.CreatedOn,
                LastUpdatedOn = from.LastUpdatedOn,
            };
        }
    }
}
