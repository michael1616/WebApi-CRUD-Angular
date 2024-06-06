using Microsoft.EntityFrameworkCore;

namespace WebApi.DTO
{
    [Keyless]
    public class ResponseSpDTO
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Capital { get; set; } = null!;

        public bool State { get; set; }

        public long IdRow { get; set; }
    }
}
