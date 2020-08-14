using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.ClientModels
{
    public class BaseListClientModel<TClientModel> : BaseClientModel
    {
        public List<TClientModel> Data { get; set; }
    }
}

