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
    public partial class PracownikDodajTowarForm : System.Web.UI.Page
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
            CenaTB.Text = CenaTB.Text.Replace(".", ",");
            string x = "Insert into Towar values (";
            x += "(select top (1) Ga_ID from Gatunek where Ga_Gatunek='" + DropDownList1.Text + "'),";
            x += "(select top (1) Ty_ID from Typ where Ty_Typ = '" + DropDownList2.Text + "'),";
            x += Convert.ToDecimal(CenaTB.Text).ToString().Replace(",",".") + ",";
            x += Convert.ToInt32(IloscNaMagazynieTB.Text) + ",";
            x+="'" + NazwaTB.Text + "')";
            cmd.CommandText = x;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Users/Pracownik/PracownikForm.aspx");
        }

        protected void AnulujBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/Pracownik/PracownikForm.aspx");
        }

        protected void LessBT_Click(object sender, EventArgs e)
        {
            IloscNaMagazynieTB.Text = (Convert.ToInt32(IloscNaMagazynieTB.Text) - 1).ToString();
        }

        protected void MoreBT_Click(object sender, EventArgs e)
        {
            IloscNaMagazynieTB.Text = (Convert.ToInt32(IloscNaMagazynieTB.Text) + 1).ToString();
        }
    }
}