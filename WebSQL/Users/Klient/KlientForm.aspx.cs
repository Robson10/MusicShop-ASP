using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Klient
{
    public partial class KlientForm : System.Web.UI.Page
    {
        int AktualnyKlientID = 0; //!--------------Odczytać wartość przy logowaniu i ją tu przesłać-----------------------!//

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void PrzegladajTowary_Click(object sender, EventArgs e)
        {
            string przeglądanieListyTowarów = 
                "select " +
                    "Towar.To_Nazwa as NazwaAlbumu, " +
                    "Towar.To_CenaAktualna as Cena, " +
                    "ty.Ty_Typ as Typ, " +
                    "Wykonawca.Wy_Imie + Wykonawca.Wy_Nazwisko as Wykonawca, " +
                    "Gatunek.Ga_Gatunek as gatunek, " +
                    "Towar.To_IloscNaStanie, " +
                    "Utwor.Ut_Name " +
                "from SklepMuzycznyV2.dbo.Towar " +
                    "inner join SklepMuzycznyV2.dbo.Typ as ty on ty.Ty_ID = Towar.Ty_ID " +
                    "inner join SklepMuzycznyV2.dbo.TowarWykonawca on TowarWykonawca.To_ID = Towar.To_ID " +
                    "inner join SklepMuzycznyV2.dbo.Wykonawca on Wykonawca.Wy_ID = TowarWykonawca.Wy_ID " +
                    "inner join SklepMuzycznyV2.dbo.Gatunek on Gatunek.Ga_ID = Towar.Ga_ID " +
                    "inner join SklepMuzycznyV2.dbo.Utwor on Utwor.To_ID = Towar.To_ID " +
                "where Towar.To_IloscNaStanie > 0 order by NazwaAlbumu";
            Helper.Select(Grid, przeglądanieListyTowarów);
        }

        protected void PrzegladajZamowienia_Click(object sender, EventArgs e)
        {
            string przeglądanieZamowień = 
                "select " +
                    "Towar.To_Nazwa As Album, " +
                    "ListaTowarow.Li_IloscTowaru as Ilosc, " +
                    "ListaTowarow.Li_Cena_Zakupu as \"Cena[szt]\", " +
                    "Zamowienia.Za_KiedyKupione as Zakupiono, " +
                    "Zamowienia.Za_NaKiedy as \"Dostarczyć na\", " +
                    "Za_CzyZrealizowano as \"czy zrealizowano\" " +
                "from SklepMuzycznyV2.dbo.Zamowienia " +
                    "inner join ListaTowarow on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
                    "inner join Towar on Towar.To_ID = ListaTowarow.To_ID " +
                    "inner join Klienci on Klienci.Kl_ID = Zamowienia.Kl_ID " +
                "where Zamowienia.Kl_ID=" + AktualnyKlientID.ToString() +
                "order by Za_CzyZrealizowano desc,To_Nazwa";
            Helper.Select(Grid, przeglądanieZamowień);
        }

        protected void ZlozZamowienie_Click(object sender, EventArgs e)
        {
            //Przejscie do okna Zloz zamowienie
            Response.Redirect("~/Users/Klient/KlientZlozZamowienieForm.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}