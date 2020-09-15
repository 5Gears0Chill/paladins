using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Paladins.Common.Interfaces.SessionManager
{
    public interface ISessionManager
    {
        Task<string> GetKey();
    }
}
