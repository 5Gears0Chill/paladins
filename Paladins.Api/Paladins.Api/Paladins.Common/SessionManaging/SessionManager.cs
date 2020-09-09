using System;

namespace Paladins.Common.SessionManaging
{
    public sealed class SessionManager
    {
        private static SessionManager _instance = null;
        private static readonly object _lock = new object();

        // this would be whatever session token your server needs to use
        private static string _key;
        // a reference to when it was last updated
        private static DateTime _updateTime;

        // constructor which updates key if the key is null when instantiated
        private SessionManager()
        {
            if (_key == null)
            {
                UpdateKey();
            }
        }

        // realistically this would be some async thing that speaks to another API
        private void UpdateKey()
        {
            _key = Guid.NewGuid().ToString();
            _updateTime = DateTime.Now;
        }

        // this is how you get the session key
        public string GetKey()
        {
            // check age of key and get a new one if needed
            if ((DateTime.Now - _updateTime).TotalSeconds > 15)
            {
                UpdateKey();
            }

            return _key;
        }

        // singleton instance, uses single locking (should actually use double locking)
        public static SessionManager Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new SessionManager();
                    }
                    return _instance;
                }
            }
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