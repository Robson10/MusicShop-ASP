<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracownikDodajTowarForm.aspx.cs" Inherits="WebSQL.Pracownik.PracownikDodajTowarForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:500px">
            <asp:Label ID="Label1" runat="server" Text="Nazwa" Width="25%"/>   
            <asp:TextBox ID="NazwaTB" runat="server" Width="70%"/>

            <asp:Label ID="Label2" runat="server" Text="Gatunek" Width="25%"/>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ga_Gatunek" DataValueField="Ga_Gatunek" Width="70%"/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" SelectCommand="SELECT [Ga_Gatunek] FROM [Gatunek]"/>
            

            <asp:Label ID="Label3" runat="server" Text="Typ" Width="25%"/>
          <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ty_Typ" DataValueField="Ty_Typ" width="70%"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" SelectCommand="SELECT [Ty_Typ] FROM [Typ]"/>
        

            <asp:Label ID="Label4" runat="server" Text="Cena" Width="25%"/>
            <asp:TextBox ID="CenaTB" runat="server" Width="70%" TextMode="Number" Text="0,0"  />

            <asp:Label ID="Label5" runat="server" Text="IloscNaMagazynie" Width="25%"/>
            <asp:TextBox ID="IloscNaMagazynieTB" runat="server" Text="0" TextMode="Number" Width="55%"/>
            <asp:Button ID="LessBT" runat="server" Text="-" OnClick="LessBT_Click"/>
            <asp:Button ID="MoreBT" runat="server" Text="+" OnClick="MoreBT_Click"/>
            <center>
                <asp:Button ID="DodajBT" runat="server" Text="Dodaj" OnClick="DodajBT_Click" />
                <asp:Button ID="AnulujBT" runat="server" Text="Anuluj" OnClick="AnulujBT_Click" />
            </center>

            </div>
    </form>
</body>
</html>
