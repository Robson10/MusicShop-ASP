using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Pracownik
{
    public partial class PracownikDodajWykonawce : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DodajBT_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Helper.ConnectionString);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string x = "Insert into Wykonawca values ('"+ImieTB.Text+"','"+ NazwiskoTB.Text + "')";
            cmd.CommandText = x;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Users/Pracownik/PracownikForm.aspx");
        }

        protected void AnulujBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/Pracownik/PracownikForm.aspx");
        }
    }
}