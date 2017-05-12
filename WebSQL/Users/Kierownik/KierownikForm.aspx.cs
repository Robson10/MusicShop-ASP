using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Users.Kierownik
{
    public partial class KierownikForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void ModyfikujPracownicyBT_Click(object sender, EventArgs e)
        {
            GridView1.Visible = !GridView1.Visible;
        }

        protected void DodatkoweFunkcjeBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/Kierownik/KierownikFunkcjeForm.aspx");
        }

        protected void WylogujBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}