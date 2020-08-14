using Paladins.Common.Validation;

namespace Paladins.Common.Responses
{
    public class Response<TItemType> : ValidationResponse
    {
        public TItemType Data { get; set; }

        public Response() { }
    }
}
