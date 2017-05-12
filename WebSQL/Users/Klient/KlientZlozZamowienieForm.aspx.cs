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
    public partial class KlientZlozZamowienieForm : System.Web.UI.Page
    {
        List<MojTowar> NowaListaTowarow = new List<MojTowar>();
        List<MojTowar> Rachunek = new List<MojTowar>();
        int KlientID = 0;//trzeba pobierać z wczesniej przy logowaniu
        DateTime KiedyKupiono = new DateTime();
        protected void Page_Load(object sender, EventArgs e)
        {

            var temp= (List<MojTowar>)ViewState["NowaListaTowarow"];
            if (temp!=null && temp.Count > 0)
                NowaListaTowarow = (List<MojTowar>)ViewState["NowaListaTowarow"];
            else
            {
                if (TowarCombo.Items.Count < 1)
                {
                    string przeglądanieListyTowarów = "select Towar.To_ID,Towar.To_Nazwa,Towar.To_CenaAktualna from Towar";
                    BaseOperation(new GridView(), TowarCombo, przeglądanieListyTowarów, 1);
                    Page.Session.Add("NowaListaTowarow", NowaListaTowarow);
                    ViewState["NowaListaTowarow"] = NowaListaTowarow;
                }
            }
        }

        private void BaseOperation(GridView Grid,DropDownList combo, string query, int ListType, string connectionString = "Data Source=DESKTOP-KL9U024; Initial Catalog=SklepMuzycznyV2;Integrated Security=SSPI")
        {
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                Grid.DataSource = dt;
                if (ListType == 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataRow x = dt.Rows[i];
                        NowaListaTowarow.Add(new MojTowar(x.Field<Int32>(0), x.Field<string>(1), x.Field<decimal>(2)));
                        combo.Items.Add(NowaListaTowarow[i].Nazwa);
                    }
                }
            }
        }
        private void aktualizujGrida()
        {
            Grid.DataSource = null;
            Grid.DataSource = (Rachunek);
            Grid.DataBind();
        }
        protected void DodajDoZamowienia_Click(object sender, EventArgs e)
        {
            var temp = (List<MojTowar>)ViewState["Rachunek"];
            if (temp != null && temp.Count > 0)
                Rachunek = (List<MojTowar>)ViewState["Rachunek"];

            if (TowarCombo.SelectedIndex > -1 && Convert.ToInt32(IleSztukTB.Text) > 0)
            {
                NowaListaTowarow[TowarCombo.SelectedIndex].IloscTowaru = Convert.ToInt32(IleSztukTB.Text);
                try
                {
                    Rachunek.Find(x => x.Nazwa.Equals(TowarCombo.Items[TowarCombo.SelectedIndex].ToString())).IloscTowaru = Convert.ToInt32(IleSztukTB.Text);
                }
                catch
                {
                    Rachunek.Add(NowaListaTowarow[TowarCombo.SelectedIndex]);
                }
                ViewState["Rachunek"] = Rachunek;
                aktualizujGrida();
            }
        }

        protected void Cofnij_Click(object sender, EventArgs e)
        {
            var temp = (List<MojTowar>)ViewState["Rachunek"];
            if (temp != null && temp.Count > 0)
                Rachunek = (List<MojTowar>)ViewState["Rachunek"];
            if (Rachunek.Count > 0)
            {
                Rachunek.RemoveAt(Rachunek.Count - 1);
                ViewState["Rachunek"] = Rachunek;
                aktualizujGrida();
            }
        }

        protected void Less_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(IleSztukTB.Text)>0)
            IleSztukTB.Text = (Convert.ToInt32(IleSztukTB.Text) - 1).ToString();
            updateCena();
        }

        protected void More_Click(object sender, EventArgs e)
        {
            IleSztukTB.Text = (Convert.ToInt32(IleSztukTB.Text)+ 1).ToString();
            updateCena();
        }

        protected void Zatwierdz_Click(object sender, EventArgs e)
        {
            KiedyKupiono = DateTime.Now;

             if (Kalendarz.SelectedDate < KiedyKupiono.AddDays(1))
            {
                ///MessageBox.Show("Nasza firma  jest w stanie dostarczyć zamowienia na za 2dni najwczesniej");
            }
            else
            {
                var x = Kalendarz.SelectedDate;
                string kiedyKupiono = "'" + KiedyKupiono.Year + "." + ((KiedyKupiono.Month < 10) ? ("0" + KiedyKupiono.Month.ToString()) : KiedyKupiono.Month.ToString()) + "." + ((KiedyKupiono.Day < 10) ? "0" + KiedyKupiono.Day.ToString() : KiedyKupiono.Day.ToString()) + "'";
                string naKiedy = "'" + x.Year + "." + ((x.Month < 10) ? ("0" + x.Month.ToString()) : x.Month.ToString()) + "." + ((x.Day < 10) ? "0" + x.Day.ToString() : x.Day.ToString()) + "'";

                string query = "insert into SklepMuzycznyV2.dbo.Zamowienia (Kl_ID,Za_NaKiedy,Za_KiedyKupione,Za_CzyZrealizowano)" +
                        "values(" + KlientID + "," + naKiedy + "," + kiedyKupiono + "," + 0 + ")";
                Helper.InsertData(query, "Zamowienia");

                GridView temp = new GridView();
                Helper.Select(temp,"select * from SklepMuzycznyV2.dbo.Zamowienia where Zamowienia.Kl_ID=" + KlientID.ToString());
                int idZamowienia = Convert.ToInt32(temp.Rows[temp.Rows.Count - 1].Cells[0].Text);

                var tempR = (List<MojTowar>)ViewState["Rachunek"];
                if (tempR != null && tempR.Count > 0)
                    Rachunek = (List<MojTowar>)ViewState["Rachunek"];
                for (int i = 0; i < Rachunek.Count; i++)
                {
                    query = "insert into SklepMuzycznyV2.dbo.ListaTowarow(Za_ID, To_ID, Li_IloscTowaru, Li_Cena_Zakupu)" +
                        "values(" + idZamowienia + "," + Rachunek[i].ID + "," + Rachunek[i].IloscTowaru + "," + Rachunek[i].Cena.ToString().Replace(",", ".") + ")";
                    Helper.InsertData(query, "ListaTowarow");
                }
                Response.Redirect("~/Users/Klient/KlientForm.aspx");
            }
        }

        protected void Anuluj_Click(object sender, EventArgs e)
        {
            //zamkniecie strony i powrot do glownej strony klienta

            Response.Redirect("~/Users/Klient/KlientForm.aspx");
        }
        private void updateCena()
        {            
            decimal cena = NowaListaTowarow[TowarCombo.SelectedIndex].Cena;
            CenaTB.Text = (cena *Convert.ToInt32( IleSztukTB.Text)).ToString()+" PLN";
        }

        protected void TowarCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateCena();
        }

    }
    [Serializable]
    class MojTowar
    {
        public MojTowar(int _id, string _nazwa, decimal cena)
        {
            ID = _id;
            Nazwa = _nazwa;
            Cena = Convert.ToDecimal(cena.ToString());//.Substring(0, cena.ToString().Length-2));
        }
        public int ID { get; private set; }
        public string Nazwa { get; private set; }
        public decimal Cena { get; private set; }
        public int IloscTowaru { get; set; }
    }
}