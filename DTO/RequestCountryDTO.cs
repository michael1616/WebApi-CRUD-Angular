namespace WebApi.DTO
{
    public class RequestCountryDTO
    {
        public int PageNumber { get; set; }

        public int PageSize { get; set; }

        public string OrderBy { get; set; }

        public string OrderDir { get; set; }

        public string GeneralFilter { get; set; }

        public List<Filters> Filters { get; set; }
    }


    public class Filters
    {
        public string keyTable { get; set; }

        public string ValueTable { get; set; }
    }
}
