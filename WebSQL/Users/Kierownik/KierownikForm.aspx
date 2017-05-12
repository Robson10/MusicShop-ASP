<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KierownikForm.aspx.cs" Inherits="WebSQL.Users.Kierownik.KierownikForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="WylogujBT" runat="server" Text="Wyloguj" Style="float:right" OnClick="WylogujBT_Click" />
            <asp:Button ID="ModyfikujPracownicyBT" runat="server" Text="ModyfikujPracowników" OnClick="ModyfikujPracownicyBT_Click" />
            <asp:Button ID="DodatkoweFunkcjeBT" runat="server" Text="Dodatkowe funkcje" OnClick="DodatkoweFunkcjeBT_Click" />
        </div>
        <br />
        <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Pr_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Pr_ID" HeaderText="Pr_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pr_ID" Visible="false" />
                    <asp:BoundField DataField="Pr_Imie" HeaderText="Pr_Imie" SortExpression="Pr_Imie" />
                    <asp:BoundField DataField="Pr_Nazwisko" HeaderText="Pr_Nazwisko" SortExpression="Pr_Nazwisko" />
                    <asp:BoundField DataField="Pr_AdresPracy" HeaderText="Pr_AdresPracy" SortExpression="Pr_AdresPracy" />
                    <asp:CheckBoxField DataField="Pr_CzyZatrudniony" HeaderText="Pr_CzyZatrudniony" SortExpression="Pr_CzyZatrudniony" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Pracownicy] WHERE [Pr_ID] = @Pr_ID" InsertCommand="INSERT INTO [Pracownicy] ([Pr_Imie], [Pr_Nazwisko], [Pr_AdresPracy], [Pr_CzyZatrudniony]) VALUES (@Pr_Imie, @Pr_Nazwisko, @Pr_AdresPracy, @Pr_CzyZatrudniony)" SelectCommand="SELECT * FROM [Pracownicy]" UpdateCommand="UPDATE [Pracownicy] SET [Pr_Imie] = @Pr_Imie, [Pr_Nazwisko] = @Pr_Nazwisko, [Pr_AdresPracy] = @Pr_AdresPracy, [Pr_CzyZatrudniony] = @Pr_CzyZatrudniony WHERE [Pr_ID] = @Pr_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Pr_Imie" Type="String" />
                    <asp:Parameter Name="Pr_Nazwisko" Type="String" />
                    <asp:Parameter Name="Pr_AdresPracy" Type="String" />
                    <asp:Parameter Name="Pr_CzyZatrudniony" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Pr_Imie" Type="String" />
                    <asp:Parameter Name="Pr_Nazwisko" Type="String" />
                    <asp:Parameter Name="Pr_AdresPracy" Type="String" />
                    <asp:Parameter Name="Pr_CzyZatrudniony" Type="Boolean" />
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
