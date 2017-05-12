<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KlientForm.aspx.cs" Inherits="WebSQL.Klient.KlientForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Logout" runat="server" Text="Wyloguj"  style="float:right" OnClick="Logout_Click"/>
            <asp:Button ID="PrzegladajTowary" runat="server" Text="Przegladaj Towary" OnClick="PrzegladajTowary_Click" />
            <asp:Button ID="PrzegladajZamowienia" runat="server" Text="Przeglądaj Zamowienia" OnClick="PrzegladajZamowienia_Click" />
            <asp:Button ID="ZlozZamowienie" runat="server" Text="Zloz Zamowienie" OnClick="ZlozZamowienie_Click" />
        </div>
        <div>

            <asp:GridView ID="Grid" runat="server">
            </asp:GridView>

        </div>
    </form>
</body>
</html>
