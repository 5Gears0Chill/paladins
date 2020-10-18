using Paladins.Common.Requests.Admin;
using PaladinsAdmin.Models.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PaladinsAdmin.Factories.Interfaces
{
    public interface IExceptionLogFactory
    {
        Task<ExceptionLogListModel> MakeListModel(ExceptionLogAdminSearchModel searchModel);
    }
}
