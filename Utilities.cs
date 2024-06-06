using System.Data;
using System.Reflection;

namespace WebApi
{
    public class Utilities
    {
        public string LowerFirstChar(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return null;
            }

            string upper = char.ToLower(input[0]) + input.Substring(1);

            return upper;
        }


        public static List<T> ConvertDataTable<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }


        public static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }
    }
}
