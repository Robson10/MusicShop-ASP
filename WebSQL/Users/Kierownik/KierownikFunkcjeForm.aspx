<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KierownikFunkcjeForm.aspx.cs" Inherits="WebSQL.Users.Kierownik.KierownikFunkcjeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Wyloguj" runat="server" Text="Wyloguj" style="float:right" OnClick="Wyloguj_Click"/></div>
        <div>
            <div style="float:right">
                <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                    Od/Na
                    <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
                </asp:TableCell>
                     <asp:TableCell>
                    Do  
                    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                         </asp:TableCell>
                </asp:TableRow>
                    </asp:Table>
            </div>
            <asp:Table ID="Table1" runat="server">
                 <asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="DaneZaSprzedzazTowaru" runat="server" Text="Dane za sprzedzaz towaru na" width="100%" OnClick="DaneZaSprzedzazTowaru_Click"/></asp:TableCell>
                    <asp:TableCell><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="ListaKlientow1" runat="server" Text="Lista Klientow" width="100%" OnClick="ListaKlientow1_Click"/></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox1" runat="server"/><asp:Label ID="Label1" runat="server" Text="zł"></asp:Label></asp:TableCell></asp:TableRow><asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="ListaTowarówSprzedanychOdDoBT" runat="server" Text="Towary Sprzedane Od Do" width="100%" OnClick="ListaTowarówSprzedanychOdDoBT_Click"/></asp:TableCell>
                    <asp:TableCell><asp:Button ID="WykonaneZamPrac" runat="server" Text="WykonaneZam/Prac" width="100%" OnClick="WykonaneZamPrac_Click"/></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="NajwiekszaLiczbaZamowienNa" runat="server" Text="Najwieksza Liczba Zamowien Na" width="100%" OnClick="NajwiekszaLiczbaZamowienNa_Click"/></asp:TableCell>
                    <asp:TableCell><asp:Button ID="TowaryDoZamowienia" runat="server" Text="TowaryDoZamowienia" width="100%" OnClick="TowaryDoZamowienia_Click"/></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="ListaKlientow2" runat="server" Text="Lista Klientow" width="100%" OnClick="ListaKlientow2_Click"/></asp:TableCell>
                    <asp:TableCell><asp:Button ID="BrakujaceTowary" runat="server" Text="BrakujaceTowary" width="100%" OnClick="BrakujaceTowary_Click"/></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow Width="300px">
                    <asp:TableCell><asp:Button ID="SumaZamowienNa" runat="server" Text="Suma Zamowien Na" width="100%" OnClick="SumaZamowienNa_Click"/></asp:TableCell>
                    <asp:TableCell><asp:Button ID="NajczesciejZamawianeTowary" runat="server" Text="NajczesciejZamawianeTowary" width="100%" OnClick="NajczesciejZamawianeTowary_Click"/></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
