using System.Net;

namespace WebApi.DTO
{
    public class APIResponseDTO
    {
        public APIResponseDTO() => ErrorMessages = new List<string>();

        public HttpStatusCode StatusCode { get; set; }

        public bool IsExitoso { get; set; } = true;

        public List<string> ErrorMessages { get; set; }

        public object Resultado { get; set; }

        public long TotalRecords { get; set; }
    }
}
