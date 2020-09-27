namespace Paladins.Common.Requests
{
    public class PlayerBaseRequest : BaseRequest
    {
        public string PlayerName { get; set; }

        public static PlayerBaseRequest Create(string playerName)
        {
            return new PlayerBaseRequest
            {
                PlayerName = playerName,
            };
        }
    }
}
