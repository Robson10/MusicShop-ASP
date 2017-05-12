<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracownikDodajTowarForm.aspx.cs" Inherits="WebSQL.Pracownik.PracownikDodajTowarForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div >
            <asp:Table ID="Table1" runat="server" Height="190px">
                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label1" runat="server" Text="Nazwa" Width="100%"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="NazwaTB" runat="server" Width="100%"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label2" runat="server" Text="Gatunek" Width="100%"/></asp:TableCell>
                    <asp:TableCell> <asp:DropDownList ID="GatunekCombo" runat="server" Width="100%"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label3" runat="server" Text="Typ" Width="100%"/></asp:TableCell>
                    <asp:TableCell><asp:DropDownList ID="TypCombo" runat="server" Width="100%"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label4" runat="server" Text="Cena" Width="100%"/></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="CenaTB" runat="server" Width="100%"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label5" runat="server" Text="IloscNaMagazynie" Width="100%"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="IloscNaMagazynieTB" runat="server" ></asp:TextBox>
                        <asp:Button ID="LessBT" runat="server" Text="-" OnClick="LessBT_Click"/>
                        <asp:Button ID="MoreBT" runat="server" Text="+" OnClick="MoreBT_Click"/>
                    </asp:TableCell>
                </asp:TableRow>             
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
             <asp:GridView ID="GridView1" runat="server"/>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell ColumnSpan="2" style="text-align: center;vertical-align: middle;">            
                        <asp:Button ID="DodajBT" runat="server" Text="Dodaj" OnClick="DodajBT_Click" />
                        <asp:Button ID="AnulujBT" runat="server" Text="Anuluj" OnClick="AnulujBT_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </div>
    </form>
</body>
</html>
