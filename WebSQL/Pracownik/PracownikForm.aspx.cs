using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Pracownik
{
    public partial class PracownikForm : System.Web.UI.Page
    {
        int AktualnyPracownikID = 10;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grid1_OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
        }
        protected void Grid2_OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView2, "Select$" + e.Row.RowIndex);
        }
        protected void Grid1_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    GridView2.Visible = true;
                    string UtworQuery = "SELECT [Ut_ID],[Ut_Name],[Ut_CzasUtworu]FROM[SklepMuzycznyV2].[dbo].[Utwor] where To_ID = " + GridView1.SelectedRow.Cells[0].Text;
                    Helper.Select(GridView2, UtworQuery);
                    //http://stackoverflow.com/questions/16280495/gridview-edit-mode-programatically
                    //CommandField cField = new CommandField();
                    //cField.EditText = "Edit";
                    //cField.ShowEditButton = true;
                    //GridView1.Columns.Insert(0, cField);
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void Grid2_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowIndex == GridView2.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }


        protected void PrzegladajDaneKlientowBT_Click(object sender, EventArgs e)
        {
            string klienciQuerry = "SELECT [Kl_ID],[Kl_Imie] ,[Kl_Nazwisko] ,[Kl_Pesel],[Kl_Mail],[Kl_Adres]FROM[SklepMuzycznyV2].[dbo].[Klienci]";
            Helper.Select(GridView1, klienciQuerry);
            GridView2.Visible = false;
        }

        protected void PrzegladajZamowieniaBT_Click(object sender, EventArgs e)
        {
            string daneZamowieniaQuerry =
                "select " +
                    "Towar.To_Nazwa as Nazwa," +
                    "ListaTowarow.Li_IloscTowaru as IloscTowaru," +
                    "ListaTowarow.Li_Cena_Zakupu as CenaZakupu," +
                    "Klienci.Kl_Imie as KlImie," +
                    "Klienci.Kl_Nazwisko as KlNazwisko," +
                    "Klienci.Kl_Mail as Mail," +
                    "Klienci.Kl_Adres as Adres," +
                    "Left(Zamowienia.Za_KiedyKupione,11) as 'Kupione Dnia'," +
                    "Left(Zamowienia.Za_NaKiedy,11) as 'Realizacja na'," +
                    "Zamowienia.Za_CzyZrealizowano as CzyZrealizowano " +
                "from SklepMuzycznyV2.dbo.Zamowienia " +
                    "inner join SklepMuzycznyV2.dbo.Klienci on Zamowienia.Kl_ID= Klienci.Kl_ID " +
                    "inner join SklepMuzycznyV2.dbo.Pracownicy on Zamowienia.Pr_ID= Pracownicy.Pr_ID " +
                    "inner join SklepMuzycznyV2.dbo.ListaTowarow on Zamowienia.Za_ID= ListaTowarow.Za_ID " +
                    "inner join SklepMuzycznyV2.dbo.Towar on ListaTowarow.To_ID= Towar.To_ID " +
                    "where Zamowienia.Pr_ID = " + AktualnyPracownikID + " or Zamowienia.Pr_ID = '0' " +
                    "Order by Za_CzyZrealizowano asc";
            Helper.Select(GridView1, daneZamowieniaQuerry);
            GridView2.Visible = false;
        }

        protected void ModyfikujTowarBT_Click(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            string TowarQuerry = "SELECT [To_ID],[To_Nazwa],[To_CenaAktualna],[To_IloscNaStanie] FROM[SklepMuzycznyV2].[dbo].[Towar]";
            Helper.Select(GridView1, TowarQuerry);
            AktualizujBazeBT.Visible = true;
        }


        protected void DodajTowarBT_Click(object sender, EventArgs e)
        {
            //Otwarcie strony DodajTowarForm
        }

        protected void DodajWykonawceBT_Click(object sender, EventArgs e)
        {
            //Otwarcie strony DodajWykonawceForm
        }

        protected void WylogujBT_Click(object sender, EventArgs e)
        {
            //powrot do strony logowania
        }

        protected void AktualizujBazeBT_Click(object sender, EventArgs e)
        {

        }
    }
}