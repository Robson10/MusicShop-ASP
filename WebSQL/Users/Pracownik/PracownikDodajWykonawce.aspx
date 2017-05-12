<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracownikDodajWykonawce.aspx.cs" Inherits="WebSQL.Pracownik.PracownikDodajWykonawce" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">      
        <div style="width:500px">
            
            <center>Dodaj Wykonawce</center>
            <asp:Label ID="Label1" runat="server" Text="Imię" Width="25%"/>   
            <asp:TextBox ID="ImieTB" runat="server" Width="70%"/>
                        
            <asp:Label ID="Label4" runat="server" Text="Nazwisko" Width="25%"/>
            <asp:TextBox ID="NazwiskoTB" runat="server" Width="70%" TextMode="SingleLine"/>

            <center>
                <asp:Button ID="DodajBT" runat="server" Text="Dodaj" OnClick="DodajBT_Click" />
                <asp:Button ID="AnulujBT" runat="server" Text="Anuluj" OnClick="AnulujBT_Click" />
            </center>

            </div>
    </form>
</body>
</html>
