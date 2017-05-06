<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracownikForm.aspx.cs" Inherits="WebSQL.Pracownik.PracownikForm" EnableEventValidation = "false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="WylogujBT" runat="server" Text="Wyloguj" style="float:right" OnClick="WylogujBT_Click"/>
            <asp:Button ID="PrzegladajDaneKlientowBT" runat="server" Text="Przeglądaj dane Klientów" OnClick="PrzegladajDaneKlientowBT_Click" />
            <asp:Button ID="PrzegladajZamowieniaBT" runat="server" Text="Przeglądaj zamowienia" OnClick="PrzegladajZamowieniaBT_Click" />
            <asp:Button ID="ModyfikujTowarBT" runat="server" Text="Modyfikuj Towary" OnClick="ModyfikujTowarBT_Click" />
            <asp:Button ID="DodajTowarBT" runat="server" Text="Dpdaj towar" OnClick="DodajTowarBT_Click" />
            <asp:Button ID="DodajWykonawceBT" runat="server" Text="Dodaj wykonawce" OnClick="DodajWykonawceBT_Click" />
        </div>
        <br/>
        <div>
            <asp:Button ID="AktualizujBazeBT" runat="server" Text="Aktualizuj Baze" OnClick="AktualizujBazeBT_Click" Visible="False" />
        </div>
        <div>
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound = "Grid1_OnRowDataBound" OnSelectedIndexChanged = "Grid1_OnSelectedIndexChanged">
            <%--OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">--%>
            
        </asp:GridView>
            <br />
        <asp:GridView ID="GridView2" runat="server" OnRowDataBound = "Grid2_OnRowDataBound" OnSelectedIndexChanged = "Grid2_OnSelectedIndexChanged">
        </asp:GridView>
        </div>
    </form>
</body>
</html>
