using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Pracownik
{
    public partial class PracownikForm : System.Web.UI.Page
    {

        //do zrealizowania : edycja grid1 i grid2 dla "modyfikuj towary
        int AktualnyPracownikID = 10;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PrzegladajDaneKlientowBT_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
        }

        protected void PrzegladajZamowieniaBT_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
        }

        protected void ModyfikujTowarBT_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
            GridView4.Visible = true;
            GridView5.Visible = false;
        }


        protected void DodajTowarBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("PracownikDodajTowarForm.aspx");
            //Otwarcie strony DodajTowarForm
        }

        protected void DodajWykonawceBT_Click(object sender, EventArgs e)
        {

            Response.Redirect("PracownikDodajWykonawce.aspx");
            //Otwarcie strony DodajWykonawceForm
        }

        protected void WylogujBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }


        protected void SqlDataSource5_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                GridView2.DataBind();
                GridView5.Visible = false;

            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView5.Visible = true;
        }
    }
}