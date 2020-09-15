using Paladins.Common.Interfaces.Clients;
using Paladins.Common.Interfaces.SessionManager;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Paladins.Service
{
    public sealed class SessionManager : ISessionManager
    {

        private readonly ISessionClient _sessionClient;

        public SessionManager(ISessionClient sessionClient)
        {
            _sessionClient = sessionClient;
        }

        // this would be whatever session token your server needs to use
        private static string _key;
        // a reference to when it was last updated
        private static DateTime _updateTime;

        // realistically this would be some async thing that speaks to another API
        private async Task UpdateKey()
        {
            var cr = await _sessionClient.GetClientSessionAsync();
            _key = cr.SessionId;
            _updateTime = DateTime.Now;
            await Task.CompletedTask;
        }

        // this is how you get the session key
        public async Task<string> GetKey()
        {
            // check age of key and get a new one if needed
            if ((DateTime.Now - _updateTime).TotalMinutes > 15)
            {
                await UpdateKey();
            }

            return _key;
        }

    }
}
/*
 * THIS IS HOW ITS USED
 * 
 *  var startTime = DateTime.Now;
            while (true)
            {
                // get a key, this should update every 15 seconds
                var key = SessionManager.Instance.GetKey();
                Console.WriteLine($"Session Key: {key}");
                Console.WriteLine($"Time since start: {(DateTime.Now - startTime).TotalSeconds}");
                Console.WriteLine("Press enter to check the key again");
                Console.ReadLine();
            }
*/