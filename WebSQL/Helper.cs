using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace WebSQL
{
    public class Helper
    {
        static string ConnectionString = "Data Source=DESKTOP-KL9U024; Initial Catalog=SklepMuzycznyV2;Integrated Security=SSPI"; //important!!!

        public static void Select(GridView Grid, string query)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    conn.Close();

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Grid.DataSource = ds.Tables[0];
                    Grid.DataBind();
                }
                catch (Exception ex)
                { }
            }
        }
        public static void InsertData(string querry, string tableName)
        {
            using (SqlConnection con = new SqlConnection() { ConnectionString = ConnectionString })
            {
                con.Open();
                SqlCommand command = new SqlCommand(querry, con);
                command.ExecuteNonQuery();
                con.Close();
            }
        }
    }

}