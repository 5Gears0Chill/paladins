using Paladins.Common.Models;
using Paladins.Common.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.Strategies
{
    public interface IPlayerStrategy<TRequest, TClientModel, TResponseModel>
    {
        Task<Response<PlayerModel>> Get(TRequest request);
        PlayerModel Populate(IList<TClientModel> clientResponse);
        Task<IEnumerable<TResponseModel>> Find();
        Task<Response<PlayerModel>> Process(Response<PlayerModel> response, IEnumerable<TResponseModel> model);
    }
}
