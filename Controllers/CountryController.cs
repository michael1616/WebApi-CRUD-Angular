using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Net;
using System.Reflection;
using WebApi.DTO;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CountryController : ControllerBase
    {

        private readonly APIResponseDTO _response;
        private readonly DBCountry _db;

        public CountryController(DBCountry db)
        {
            _response = new();
            _db = db;
        }

        [HttpPost("PostAddCountry")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> PostAddCountry([FromBody] Country request)
        {
            try
            {
                if (_db.Countries.Where(a => a.Name == request.Name).Any())
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages = new List<string>() { "The country is already exists" };

                    return BadRequest(_response);
                }


                await _db.Countries.AddAsync(request);
                await _db.SaveChangesAsync();


                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }
        }


        [HttpPut("PutCountry")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> PutCountry([FromBody] Country request)
        {
            try
            {

                _db.Countries.Update(request);
                await _db.SaveChangesAsync();


                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }
        }

        [HttpPut("PutCountryState/{id:int}/{state:bool}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> PutCountryState(int id, bool state)
        {
            try
            {

                Country country = _db.Countries.Find(id);
                country.State = state;

                _db.Countries.Update(country);
                await _db.SaveChangesAsync();


                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }
        }

        [HttpPost("PostCountries")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult PostCountries([FromBody] RequestCountryDTO request)
        {

            try
            {
                var dataTable = new DataTable();
                DataTable dt = ToDataTable(request.Filters);

                SqlParameter paramPageSize = new SqlParameter
                {
                    ParameterName = "@pPageSize",
                    Value = request.PageSize,
                    DbType = DbType.Int32
                };

                SqlParameter paramPageNumber = new SqlParameter
                {
                    ParameterName = "@pPageIndex",
                    Value = request.PageNumber,
                    DbType = DbType.Int32
                };

                SqlParameter paramOrderBy = new SqlParameter
                {
                    ParameterName = "@pColumnName",
                    Value = request.OrderBy,
                    SqlDbType = SqlDbType.NVarChar
                };

                SqlParameter paramOrderDir = new SqlParameter
                {
                    ParameterName = "@pColumnOrder",
                    Value = request.OrderDir,
                    SqlDbType = SqlDbType.NVarChar
                };

                SqlParameter paramGeneralFilter = new SqlParameter
                {
                    ParameterName = "@GeneralFilter",
                    Value = string.IsNullOrEmpty(request.GeneralFilter) ? DBNull.Value : request.GeneralFilter,
                    DbType = DbType.String
                };


                SqlParameter paramTotalRecords = new SqlParameter
                {
                    ParameterName = "@pTotalCount",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Int
                };


                SqlParameter paramFilters = new SqlParameter
                {
                    ParameterName = "@Filters",
                    SqlDbType = SqlDbType.Structured,
                    TypeName = "dbo.ValueKeyFilterType",
                    Value = dt
                };


                using (SqlConnection con = new SqlConnection(_db.Database.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand("spPaginationCountryV2", con))
                    {
                        con.Open();

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(paramPageSize);
                        cmd.Parameters.Add(paramPageNumber);
                        cmd.Parameters.Add(paramGeneralFilter);
                        cmd.Parameters.Add(paramTotalRecords);
                        cmd.Parameters.Add(paramFilters);
                        cmd.Parameters.Add(paramOrderBy);
                        cmd.Parameters.Add(paramOrderDir);

                        var dataReader = cmd.ExecuteReader();
                        dataTable.Load(dataReader);
                    }
                }

                //List<ResponseSpDTO> countries = await _db.spCountries.FromSqlRaw("EXEC paGetCountries @pageNumber, @pageSize, @GeneralFilter, @Filters, @TotalRecords OUTPUT",
                //    paramPageNumber, paramPageSize, paramGeneralFilter, paramFilters, paramTotalRecords).ToListAsync();

                var data = dataTable.AsEnumerable().Select(m => new ResponseSpDTO()
                {
                    Id = m.Field<int>("Id"),
                    Name = m.Field<string>("Name"),
                    Capital = m.Field<string>("Capital"),
                    State = m.Field<bool>("State"),
                    IdRow = m.Field<long>("RowId")
                }).ToList();

                _response.TotalRecords = paramTotalRecords.Value != DBNull.Value ? Convert.ToInt64(paramTotalRecords.Value) : 0;
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = data;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }
        }


        public DataTable ToDataTable<T>(List<T> items)
        {
            var data = items as List<Filters>;

            if (data == null) return GetEmptyDatatable();

            int cont = 0;

            foreach (var item in data)
            {
                if (string.IsNullOrEmpty(item.ValueTable))
                {
                    if (cont == (data.Count - 1))
                    {
                        return GetEmptyDatatable();
                    }

                    cont++;
                }
            }

            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(new Utilities().LowerFirstChar(prop.Name));
            }

            if (items != null)
            {
                foreach (T item in items)
                {
                    var values = new object[Props.Length];
                    for (int i = 0; i < Props.Length; i++)
                    {
                        //inserting property values to datatable rows
                        values[i] = Props[i].GetValue(item, null);
                    }
                    dataTable.Rows.Add(values);
                }
            }

            //put a breakpoint here and check datatable
            return dataTable;
        }


        public static DataTable GetEmptyDatatable()
        {
            DataTable dataTable2 = new DataTable("Filters");

            dataTable2.Columns.Add("keyTable", typeof(string));
            dataTable2.Columns.Add("ValueTable", typeof(string));

            return dataTable2;
        }

    }
}
