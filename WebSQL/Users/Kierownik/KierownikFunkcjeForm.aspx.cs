using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL.Users.Kierownik
{
    public partial class KierownikFunkcjeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.Visible = false;
        }
        private string datePickerToSQLDate(Calendar x)
        {
            return x.SelectedDate.Year + " - " + ((x.SelectedDate.Month < 10) ? "0" + x.SelectedDate.Month.ToString() : x.SelectedDate.Month.ToString()) + " - " + ((x.SelectedDate.Day < 10) ? "0" + x.SelectedDate.Day.ToString() : x.SelectedDate.Day.ToString());
        }

        protected void DaneZaSprzedzazTowaru_Click(object sender, EventArgs e)
        {
            // Otrzymać listę z wartością towarów sprzedanych za określony czas(Kierownik)

            string query = "SELECT " +
                "Towar.To_Nazwa as NazwaTowaru, " +
                "ListaTowarow.Li_Cena_Zakupu as CenaZaSztuke, " +
                "ListaTowarow.Li_IloscTowaru as ZakupionychSztuk, " +
                "left(Zamowienia.Za_KiedyKupione, 11) as KiedyKupione " +
            "FROM[SklepMuzycznyV2].[dbo].[Towar] " +
                "INNER JOIN SklepMuzycznyV2.dbo.ListaTowarow on Towar.To_ID = ListaTowarow.To_ID " +
                "INNER JOIN SklepMuzycznyV2.dbo.Zamowienia on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
            "where Zamowienia.Za_KiedyKupione >= '" + datePickerToSQLDate(Calendar1) + "' and Zamowienia.Za_KiedyKupione <= '" + datePickerToSQLDate(Calendar2) + "' " +
            "ORDER BY ListaTowarow.Li_Cena_Zakupu asc; ";
            Helper.Select(GridView1, query);
        }

        protected void ListaKlientow1_Click(object sender, EventArgs e)
        {
            //np 2017.04.28
            //Otrzymać liczbę klientów którzy zamówili towary w kwocie nie mniejszej od ustalonej wartości na określony termin. (kierownik)
            string query1B = "SELECT " +
                "Klienci.Kl_Imie, Klienci.Kl_Nazwisko,ListaTowarow.Li_Cena_Zakupu*ListaTowarow.Li_Cena_Zakupu as ŁącznaKwota " +
                "FROM[SklepMuzycznyV2].[dbo].[Klienci] " +
                "INNER JOIN SklepMuzycznyV2.dbo.Zamowienia on Klienci.Kl_ID = Zamowienia.Kl_ID " +
                "INNER JOIN SklepMuzycznyV2.dbo.ListaTowarow on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
                "WHERE Li_Cena_Zakupu*Li_Cena_Zakupu >" + TextBox1.Text.Replace(",", ".") +
                "AND Zamowienia.Za_NaKiedy = '" + datePickerToSQLDate(Calendar1) + "'";
            Helper.Select(GridView1, query1B);

        }

        protected void ListaTowarówSprzedanychOdDoBT_Click(object sender, EventArgs e)
        {
            // Otrzymać listę z wartością towarów sprzedanych za określony czas(Kierownik)
            string query = "SELECT Towar.To_Nazwa as NazwaTowaru, ListaTowarow.Li_Cena_Zakupu as CenaZaSztuke, ListaTowarow.Li_IloscTowaru as ZakupionychSztuk, Zamowienia.Za_KiedyKupione " +
            "FROM[SklepMuzycznyV2].[dbo].[Towar] " +
            "INNER JOIN SklepMuzycznyV2.dbo.ListaTowarow on Towar.To_ID = ListaTowarow.To_ID " +
            "INNER JOIN SklepMuzycznyV2.dbo.Zamowienia on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
            "where Zamowienia.Za_KiedyKupione >= '" + datePickerToSQLDate(Calendar1) + "' and Zamowienia.Za_KiedyKupione <= '" + datePickerToSQLDate(Calendar2) + "' " +
            "ORDER BY ListaTowarow.Li_Cena_Zakupu asc; ";
            Helper.Select(GridView1, query);
        }

        protected void WykonaneZamPrac_Click(object sender, EventArgs e)
        {
            //Otrzymać listę zrealizowanych zamówień oddzielnymi pracownikami sklepu.(Kierownik)
            string query = "SELECT " +
                "Pracownicy.Pr_Imie, count(Zamowienia.Pr_ID) as IloscZlecen " +
                "FROM[SklepMuzycznyV2].[dbo].[Pracownicy] " +
                "inner join SklepMuzycznyV2.dbo.Zamowienia On Zamowienia.Pr_ID = Pracownicy.Pr_ID " +
                "where Zamowienia.Za_CzyZrealizowano = 1 " +
                "Group by Pracownicy.Pr_Imie " +
                "having count(Zamowienia.Za_ID) > 0 " +
                "order by IloscZlecen desc";
            Helper.Select(GridView1, query);
        }

        protected void NajwiekszaLiczbaZamowienNa_Click(object sender, EventArgs e)
        {
            //Otrzymać listę klientów którzy dokonali największą ilość zamówień za wyznaczony odcinek czasu(Kierownik)

            string query = "SELECT " +
                "Klienci.Kl_Imie,Klienci.Kl_Nazwisko, " +
                "Count(Zamowienia.Kl_ID) as ileZamowien " +
            "FROM[SklepMuzycznyV2].[dbo].Klienci " +
            "inner join SklepMuzycznyV2.dbo.Zamowienia on Zamowienia.Kl_ID = Klienci.Kl_ID " +
            "where Zamowienia.Za_NaKiedy >= '" + datePickerToSQLDate(Calendar1) + "' and Zamowienia.Za_NaKiedy <= '" + datePickerToSQLDate(Calendar2) + "' " +
            "group by Klienci.Kl_Imie,Klienci.Kl_Nazwisko " +
            "order by ileZamowien desc; ";
            Helper.Select(GridView1, query);
        }

        protected void TowaryDoZamowienia_Click(object sender, EventArgs e)
        {
            //Otrzymać listę towarów do zamówienia z hurtowni(Kierownik, Pracownik)
            string query = "SELECT " +
                "To_Nazwa as NazwaTowaru, To_IloscNaStanie " +
                "FROM[SklepMuzycznyV2].[dbo].[Towar] " +
                "where To_IloscNaStanie<10 " +
                "ORDER BY To_IloscNaStanie asc;";
            Helper.Select(GridView1, query);
        }

        protected void ListaKlientow2_Click(object sender, EventArgs e)
        {
            //Otrzymać listę klientów posortowanych według wartości ich zakupów na wyznaczony termin. (kierownik)
            string query = "SELECT " +
                "Kl_Imie as ImieKlienta,Kl_Nazwisko as NazwiskoKlienta,Zamowienia.Za_NaKiedy as NaKiedyZamowiono,ListaTowarow.Li_Cena_Zakupu* Li_IloscTowaru as lacznyKoszt " +
                "FROM[SklepMuzycznyV2].[dbo].[Klienci] " +
                "INNER JOIN SklepMuzycznyV2.dbo.Zamowienia on[Klienci].Kl_ID = Zamowienia.Kl_ID " +
                "INNER JOIN SklepMuzycznyV2.dbo.ListaTowarow on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
                "Where Zamowienia.Za_NaKiedy= '" + datePickerToSQLDate(Calendar1) + "' " +
                "ORDER BY ListaTowarow.Li_Cena_Zakupu* ListaTowarow.Li_IloscTowaru desc, Zamowienia.Za_NaKiedy";
            Helper.Select(GridView1, query);
        }

        protected void BrakujaceTowary_Click(object sender, EventArgs e)
        {
            //Otrzymać listę brakujących towarów. (Pracownik, Kierownik)
            string query = "SELECT Towar.To_Nazwa as NazwaTowaru, Towar.To_IloscNaStanie - ListaTowarow.Li_IloscTowaru as brakującyTowar FROM[SklepMuzycznyV2].[dbo].[Towar] inner join SklepMuzycznyV2.dbo.ListaTowarow on ListaTowarow.To_ID = Towar.To_ID where Towar.To_IloscNaStanie - ListaTowarow.Li_IloscTowaru < 0; ";
            Helper.Select(GridView1, query);
        }

        protected void SumaZamowienNa_Click(object sender, EventArgs e)
        {
            //Otrzymać sumę realizowanych zamówień w sklepie na wyznaczony termin. (Kierownik)
            string query = "SELECT left(Zamowienia.Za_NaKiedy, 12) as naKiedy, Count(Zamowienia.Za_ID) as IloscZlecen FROM[SklepMuzycznyV2].[dbo].Zamowienia" +
                " group by Zamowienia.Za_NaKiedy having Cast(Zamowienia.Za_NaKiedy as date) = '" + datePickerToSQLDate(Calendar1) + "'";
            Helper.Select(GridView1, query);
        }

        protected void NajczesciejZamawianeTowary_Click(object sender, EventArgs e)
        {
            //Otrzymać nazwę i ilość towarów najczęściej zamawianych w sklepie. (kierownik)

            string query = "SELECT Towar.To_Nazwa as NazwaTowaru,Towar.To_IloscNaStanie as IloscNaMagazynie,ListaTowarow.Li_IloscTowaru as IloscZamowionychDoTejPory " +
            "FROM[SklepMuzycznyV2].[dbo].[Towar] INNER JOIN SklepMuzycznyV2.dbo.ListaTowarow on Towar.To_ID = ListaTowarow.To_ID INNER JOIN SklepMuzycznyV2.dbo.Zamowienia on ListaTowarow.Za_ID = Zamowienia.Za_ID " +
            "ORDER BY ListaTowarow.Li_IloscTowaru desc; ";
            Helper.Select(GridView1, query);
        }
        
        private void setColorForButton(Color color,Button x)
        {
            Color DefaultColor = Color.Gray;
            ListaTowarówSprzedanychOdDoBT.BackColor = DefaultColor;
            DaneZaSprzedzazTowaru.BackColor = DefaultColor;
            NajwiekszaLiczbaZamowienNa.BackColor = DefaultColor;
            ListaKlientow1.BackColor = DefaultColor;
            ListaKlientow2.BackColor = DefaultColor;
            SumaZamowienNa.BackColor = DefaultColor;
            NajczesciejZamawianeTowary.BackColor = DefaultColor;
            BrakujaceTowary.BackColor = DefaultColor;
            TowaryDoZamowienia.BackColor = DefaultColor;
            WykonaneZamPrac.BackColor = DefaultColor;
            x.BackColor = color;
        }

        protected void Wyloguj_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}