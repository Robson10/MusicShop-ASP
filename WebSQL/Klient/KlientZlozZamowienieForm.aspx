<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KlientZlozZamowienieForm.aspx.cs" Inherits="WebSQL.Klient.KlientZlozZamowienieForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="TowarCombo" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="TowarCombo_SelectedIndexChanged">
            </asp:DropDownList>
             Sztuk:
            <asp:TextBox ID="IleSztukTB" runat="server" TextMode="Number" ValidateRequestMode="Enabled" ReadOnly="True" Width="45px">0</asp:TextBox>
            <asp:Button ID="Less" runat="server" Text="-" OnClick="Less_Click" />
            <asp:Button ID="More" runat="server" Text="+" OnClick="More_Click" />
            Cena:
            <asp:TextBox ID="CenaTB" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="DodajDoZamowienia" runat="server" Text="DodajDoZamowienia" OnClick="DodajDoZamowienia_Click" />
            <asp:Button ID="Cofnij" runat="server" Text="Cofnij" OnClick="Cofnij_Click" />
        </div>
        <br/>
        <div>
            <asp:GridView ID="Grid" runat="server">
            </asp:GridView>
        </div>
        <br/>
        <div>
            <asp:Calendar ID="Kalendarz" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </div>
        <br/>
        <div>
            <asp:Button ID="Zatwierdz" runat="server" Text="Zatwierdz" OnClick="Zatwierdz_Click" />
            <asp:Button ID="Anuluj" runat="server" Text="Anuluj" OnClick="Anuluj_Click" />
        </div>
    </form>
</body>
</html>
