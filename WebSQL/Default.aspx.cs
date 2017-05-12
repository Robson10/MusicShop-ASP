using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSQL
{
    public partial class _Default : Page
    {
        //w sesji przechować jaki uzyttkownik jest zalogowany
        x
        protected void Page_Load(object sender, EventArgs e)
        { 
        }
        protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
        {
            string text = Login1.UserName + Login1.Password;
            if (!tryConnectAsBoss(Login1.UserName, Login1.Password))
            {
                if (!tryConnectAsAdmin(Login1.UserName, Login1.Password))
                {
                    if (!tryConnectAsClient(Login1.UserName, Login1.Password))
                    {
                        if (!tryConnectAsEmpoyee(Login1.UserName, Login1.Password))
                        {
                            Response.Redirect(Request.RawUrl);
                        }
                        else Response.Redirect("~/Users/Pracownik/PracownikForm.aspx");
                    }
                    else Response.Redirect("~/Users/Klient/KlientForm.aspx");
                }
                else Response.Redirect("~/Users/Admin/AdminForm.aspx");
            }
            else Response.Redirect("~/Users/Kierownik/KierownikForm.aspx");
        }
        private bool tryConnectAsBoss(string login,string password)
        {
            if (login.Equals("Kierownik") && password.Equals("123"))
            {
                ScriptManager.RegisterStartupScript(this, GetType(),"ServerControlScript", "BossConnected", true);
                return true;
            }
            return false;
        }
        private bool tryConnectAsAdmin(string login, string password)
        {
            if (login.Equals("Admin") && password.Equals("123"))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "AdminConneced", true);
                return true;
            }
            return false;
        }
        private bool tryConnectAsEmpoyee(string login, string password)
        {
            string EmployeeQuerry = "select Pr_ID from SklepMuzycznyV2.dbo.Pracownicy where Pr_Imie=@Login and Pr_Nazwisko=@Password";
            int result=GetUserData(EmployeeQuerry,login,password);
            return (result == -1) ? false : true;
        }
        private bool tryConnectAsClient(string login, string password)
        {
            string KlienciQuerry = "select Kl_ID from SklepMuzycznyV2.dbo.Klienci where Kl_Imie=@Login and Kl_Pesel=@Password";
            int result= GetUserData(KlienciQuerry,login,password);

            return (result == -1) ? false : true;
        }

        private int GetUserData(string query,string Login,string Password, string connectionString = "Data Source=DESKTOP-KL9U024; Initial Catalog=SklepMuzycznyV2;Integrated Security=SSPI")
        {
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                cmd.Parameters.AddWithValue("@Login", Login);
                cmd.Parameters.AddWithValue("@Password", Password);
                string x="-1";
                try{x = cmd.ExecuteScalar().ToString();}
                catch{sqlConn.Close();return -1;}
                sqlConn.Close();
                return Convert.ToInt32(x);
            }
        }
    }
}