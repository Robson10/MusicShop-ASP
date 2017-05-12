<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminForm.aspx.cs" Inherits="WebSQL.Users.Admin.AdminForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button11" runat="server" Text="Wyloguj" style="float:right" />
            <asp:Button ID="Button1" runat="server" Text="Pracownicy" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Klienci" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Zamowienia" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="ListaTowarów" OnClick="Button4_Click" />
            <asp:Button ID="Button5" runat="server" Text="Towary" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Utwory" OnClick="Button6_Click" />
            <asp:Button ID="Button7" runat="server" Text="Typy" OnClick="Button7_Click" />
            <asp:Button ID="Button8" runat="server" Text="Wykonawcy" OnClick="Button8_Click" />
            <asp:Button ID="Button9" runat="server" Text="Gatunki" OnClick="Button9_Click" />
            <asp:Button ID="Button10" runat="server" Text="Towar-wykonawca" OnClick="Button10_Click" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Pr_ID" DataSourceID="SqlDataSource1" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Pr_ID" HeaderText="Pr_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pr_ID" />
                    <asp:BoundField DataField="Pr_Imie" HeaderText="Pr_Imie" SortExpression="Pr_Imie" />
                    <asp:BoundField DataField="Pr_Nazwisko" HeaderText="Pr_Nazwisko" SortExpression="Pr_Nazwisko" />
                    <asp:BoundField DataField="Pr_AdresPracy" HeaderText="Pr_AdresPracy" SortExpression="Pr_AdresPracy" />
                    <asp:CheckBoxField DataField="Pr_CzyZatrudniony" HeaderText="Pr_CzyZatrudniony" SortExpression="Pr_CzyZatrudniony" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Pracownicy] WHERE [Pr_ID] = @Pr_ID" InsertCommand="INSERT INTO [Pracownicy] ([Pr_Imie], [Pr_Nazwisko], [Pr_AdresPracy], [Pr_CzyZatrudniony]) VALUES (@Pr_Imie, @Pr_Nazwisko, @Pr_AdresPracy, @Pr_CzyZatrudniony)" SelectCommand="SELECT * FROM [Pracownicy] WHERE ([Pr_ID] &gt; @Pr_ID)" UpdateCommand="UPDATE [Pracownicy] SET [Pr_Imie] = @Pr_Imie, [Pr_Nazwisko] = @Pr_Nazwisko, [Pr_AdresPracy] = @Pr_AdresPracy, [Pr_CzyZatrudniony] = @Pr_CzyZatrudniony WHERE [Pr_ID] = @Pr_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Pr_Imie" Type="String" />
                    <asp:Parameter Name="Pr_Nazwisko" Type="String" />
                    <asp:Parameter Name="Pr_AdresPracy" Type="String" />
                    <asp:Parameter Name="Pr_CzyZatrudniony" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Pr_ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Pr_Imie" Type="String" />
                    <asp:Parameter Name="Pr_Nazwisko" Type="String" />
                    <asp:Parameter Name="Pr_AdresPracy" Type="String" />
                    <asp:Parameter Name="Pr_CzyZatrudniony" Type="Boolean" />
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Kl_ID" DataSourceID="SqlDataSource2" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Kl_ID" HeaderText="Kl_ID" InsertVisible="False" ReadOnly="True" SortExpression="Kl_ID" />
                    <asp:BoundField DataField="Kl_Imie" HeaderText="Kl_Imie" SortExpression="Kl_Imie" />
                    <asp:BoundField DataField="Kl_Nazwisko" HeaderText="Kl_Nazwisko" SortExpression="Kl_Nazwisko" />
                    <asp:BoundField DataField="Kl_Pesel" HeaderText="Kl_Pesel" SortExpression="Kl_Pesel" />
                    <asp:BoundField DataField="Kl_Mail" HeaderText="Kl_Mail" SortExpression="Kl_Mail" />
                    <asp:BoundField DataField="Kl_Adres" HeaderText="Kl_Adres" SortExpression="Kl_Adres" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Klienci] WHERE [Kl_ID] = @Kl_ID" InsertCommand="INSERT INTO [Klienci] ([Kl_Imie], [Kl_Nazwisko], [Kl_Pesel], [Kl_Mail], [Kl_Adres]) VALUES (@Kl_Imie, @Kl_Nazwisko, @Kl_Pesel, @Kl_Mail, @Kl_Adres)" SelectCommand="SELECT * FROM [Klienci]" UpdateCommand="UPDATE [Klienci] SET [Kl_Imie] = @Kl_Imie, [Kl_Nazwisko] = @Kl_Nazwisko, [Kl_Pesel] = @Kl_Pesel, [Kl_Mail] = @Kl_Mail, [Kl_Adres] = @Kl_Adres WHERE [Kl_ID] = @Kl_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Kl_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Kl_Imie" Type="String" />
                    <asp:Parameter Name="Kl_Nazwisko" Type="String" />
                    <asp:Parameter Name="Kl_Pesel" Type="String" />
                    <asp:Parameter Name="Kl_Mail" Type="String" />
                    <asp:Parameter Name="Kl_Adres" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Kl_Imie" Type="String" />
                    <asp:Parameter Name="Kl_Nazwisko" Type="String" />
                    <asp:Parameter Name="Kl_Pesel" Type="String" />
                    <asp:Parameter Name="Kl_Mail" Type="String" />
                    <asp:Parameter Name="Kl_Adres" Type="String" />
                    <asp:Parameter Name="Kl_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Za_ID" DataSourceID="SqlDataSource3" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Za_ID" HeaderText="Za_ID" InsertVisible="False" ReadOnly="True" SortExpression="Za_ID" />
                    <asp:BoundField DataField="Pr_ID" HeaderText="Pr_ID" SortExpression="Pr_ID" />
                    <asp:BoundField DataField="Kl_ID" HeaderText="Kl_ID" SortExpression="Kl_ID" />
                    <asp:BoundField DataField="Za_NaKiedy" HeaderText="Za_NaKiedy" SortExpression="Za_NaKiedy" />
                    <asp:BoundField DataField="Za_KiedyKupione" HeaderText="Za_KiedyKupione" SortExpression="Za_KiedyKupione" />
                    <asp:CheckBoxField DataField="Za_CzyZrealizowano" HeaderText="Za_CzyZrealizowano" SortExpression="Za_CzyZrealizowano" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Zamowienia] WHERE [Za_ID] = @Za_ID" InsertCommand="INSERT INTO [Zamowienia] ([Pr_ID], [Kl_ID], [Za_NaKiedy], [Za_KiedyKupione], [Za_CzyZrealizowano]) VALUES (@Pr_ID, @Kl_ID, @Za_NaKiedy, @Za_KiedyKupione, @Za_CzyZrealizowano)" SelectCommand="SELECT * FROM [Zamowienia]" UpdateCommand="UPDATE [Zamowienia] SET [Pr_ID] = @Pr_ID, [Kl_ID] = @Kl_ID, [Za_NaKiedy] = @Za_NaKiedy, [Za_KiedyKupione] = @Za_KiedyKupione, [Za_CzyZrealizowano] = @Za_CzyZrealizowano WHERE [Za_ID] = @Za_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                    <asp:Parameter Name="Kl_ID" Type="Int32" />
                    <asp:Parameter Name="Za_NaKiedy" Type="DateTime" />
                    <asp:Parameter Name="Za_KiedyKupione" Type="DateTime" />
                    <asp:Parameter Name="Za_CzyZrealizowano" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Pr_ID" Type="Int32" />
                    <asp:Parameter Name="Kl_ID" Type="Int32" />
                    <asp:Parameter Name="Za_NaKiedy" Type="DateTime" />
                    <asp:Parameter Name="Za_KiedyKupione" Type="DateTime" />
                    <asp:Parameter Name="Za_CzyZrealizowano" Type="Boolean" />
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Za_ID,To_ID" DataSourceID="SqlDataSource4" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Za_ID" HeaderText="Za_ID" ReadOnly="True" SortExpression="Za_ID" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" ReadOnly="True" SortExpression="To_ID" />
                    <asp:BoundField DataField="Li_IloscTowaru" HeaderText="Li_IloscTowaru" SortExpression="Li_IloscTowaru" />
                    <asp:BoundField DataField="Li_Cena_Zakupu" HeaderText="Li_Cena_Zakupu" SortExpression="Li_Cena_Zakupu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [ListaTowarow] WHERE [Za_ID] = @Za_ID AND [To_ID] = @To_ID" InsertCommand="INSERT INTO [ListaTowarow] ([Za_ID], [To_ID], [Li_IloscTowaru], [Li_Cena_Zakupu]) VALUES (@Za_ID, @To_ID, @Li_IloscTowaru, @Li_Cena_Zakupu)" SelectCommand="SELECT * FROM [ListaTowarow]" UpdateCommand="UPDATE [ListaTowarow] SET [Li_IloscTowaru] = @Li_IloscTowaru, [Li_Cena_Zakupu] = @Li_Cena_Zakupu WHERE [Za_ID] = @Za_ID AND [To_ID] = @To_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Li_IloscTowaru" Type="Int32" />
                    <asp:Parameter Name="Li_Cena_Zakupu" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Li_IloscTowaru" Type="Int32" />
                    <asp:Parameter Name="Li_Cena_Zakupu" Type="Decimal" />
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="To_ID" DataSourceID="SqlDataSource5" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" InsertVisible="False" ReadOnly="True" SortExpression="To_ID" />
                    <asp:BoundField DataField="Ga_ID" HeaderText="Ga_ID" SortExpression="Ga_ID" />
                    <asp:BoundField DataField="Ty_ID" HeaderText="Ty_ID" SortExpression="Ty_ID" />
                    <asp:BoundField DataField="To_CenaAktualna" HeaderText="To_CenaAktualna" SortExpression="To_CenaAktualna" />
                    <asp:BoundField DataField="To_IloscNaStanie" HeaderText="To_IloscNaStanie" SortExpression="To_IloscNaStanie" />
                    <asp:BoundField DataField="To_Nazwa" HeaderText="To_Nazwa" SortExpression="To_Nazwa" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Towar] WHERE [To_ID] = @To_ID" InsertCommand="INSERT INTO [Towar] ([Ga_ID], [Ty_ID], [To_CenaAktualna], [To_IloscNaStanie], [To_Nazwa]) VALUES (@Ga_ID, @Ty_ID, @To_CenaAktualna, @To_IloscNaStanie, @To_Nazwa)" SelectCommand="SELECT * FROM [Towar]" UpdateCommand="UPDATE [Towar] SET [Ga_ID] = @Ga_ID, [Ty_ID] = @Ty_ID, [To_CenaAktualna] = @To_CenaAktualna, [To_IloscNaStanie] = @To_IloscNaStanie, [To_Nazwa] = @To_Nazwa WHERE [To_ID] = @To_ID">
                <DeleteParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ga_ID" Type="Int32" />
                    <asp:Parameter Name="Ty_ID" Type="Int32" />
                    <asp:Parameter Name="To_CenaAktualna" Type="Decimal" />
                    <asp:Parameter Name="To_IloscNaStanie" Type="Int32" />
                    <asp:Parameter Name="To_Nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ga_ID" Type="Int32" />
                    <asp:Parameter Name="Ty_ID" Type="Int32" />
                    <asp:Parameter Name="To_CenaAktualna" Type="Decimal" />
                    <asp:Parameter Name="To_IloscNaStanie" Type="Int32" />
                    <asp:Parameter Name="To_Nazwa" Type="String" />
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ut_ID" DataSourceID="SqlDataSource6" OnSelectedIndexChanged="GridView6_SelectedIndexChanged" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Ut_ID" HeaderText="Ut_ID" InsertVisible="False" ReadOnly="True" SortExpression="Ut_ID" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" SortExpression="To_ID" />
                    <asp:BoundField DataField="Ut_Name" HeaderText="Ut_Name" SortExpression="Ut_Name" />
                    <asp:BoundField DataField="Ut_CzasUtworu" HeaderText="Ut_CzasUtworu" SortExpression="Ut_CzasUtworu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Utwor] WHERE [Ut_ID] = @Ut_ID" InsertCommand="INSERT INTO [Utwor] ([To_ID], [Ut_Name], [Ut_CzasUtworu]) VALUES (@To_ID, @Ut_Name, @Ut_CzasUtworu)" SelectCommand="SELECT * FROM [Utwor]" UpdateCommand="UPDATE [Utwor] SET [To_ID] = @To_ID, [Ut_Name] = @Ut_Name, [Ut_CzasUtworu] = @Ut_CzasUtworu WHERE [Ut_ID] = @Ut_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Ut_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Ut_Name" Type="String" />
                    <asp:Parameter Name="Ut_CzasUtworu" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Ut_Name" Type="String" />
                    <asp:Parameter Name="Ut_CzasUtworu" Type="DateTime" />
                    <asp:Parameter Name="Ut_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ty_ID" DataSourceID="SqlDataSource7" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Ty_ID" HeaderText="Ty_ID" InsertVisible="False" ReadOnly="True" SortExpression="Ty_ID" />
                    <asp:BoundField DataField="Ty_Typ" HeaderText="Ty_Typ" SortExpression="Ty_Typ" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Typ] WHERE [Ty_ID] = @Ty_ID" InsertCommand="INSERT INTO [Typ] ([Ty_Typ]) VALUES (@Ty_Typ)" SelectCommand="SELECT * FROM [Typ]" UpdateCommand="UPDATE [Typ] SET [Ty_Typ] = @Ty_Typ WHERE [Ty_ID] = @Ty_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Ty_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ty_Typ" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ty_Typ" Type="String" />
                    <asp:Parameter Name="Ty_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView8" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Wy_ID" DataSourceID="SqlDataSource8" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Wy_ID" HeaderText="Wy_ID" InsertVisible="False" ReadOnly="True" SortExpression="Wy_ID" />
                    <asp:BoundField DataField="Wy_Imie" HeaderText="Wy_Imie" SortExpression="Wy_Imie" />
                    <asp:BoundField DataField="Wy_Nazwisko" HeaderText="Wy_Nazwisko" SortExpression="Wy_Nazwisko" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Wykonawca] WHERE [Wy_ID] = @Wy_ID" InsertCommand="INSERT INTO [Wykonawca] ([Wy_Imie], [Wy_Nazwisko]) VALUES (@Wy_Imie, @Wy_Nazwisko)" SelectCommand="SELECT * FROM [Wykonawca]" UpdateCommand="UPDATE [Wykonawca] SET [Wy_Imie] = @Wy_Imie, [Wy_Nazwisko] = @Wy_Nazwisko WHERE [Wy_ID] = @Wy_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Wy_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Wy_Imie" Type="String" />
                    <asp:Parameter Name="Wy_Nazwisko" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Wy_Imie" Type="String" />
                    <asp:Parameter Name="Wy_Nazwisko" Type="String" />
                    <asp:Parameter Name="Wy_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView9" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ga_ID" DataSourceID="SqlDataSource9" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Ga_ID" HeaderText="Ga_ID" InsertVisible="False" ReadOnly="True" SortExpression="Ga_ID" />
                    <asp:BoundField DataField="Ga_Gatunek" HeaderText="Ga_Gatunek" SortExpression="Ga_Gatunek" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Gatunek] WHERE [Ga_ID] = @Ga_ID" InsertCommand="INSERT INTO [Gatunek] ([Ga_Gatunek]) VALUES (@Ga_Gatunek)" SelectCommand="SELECT * FROM [Gatunek]" UpdateCommand="UPDATE [Gatunek] SET [Ga_Gatunek] = @Ga_Gatunek WHERE [Ga_ID] = @Ga_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Ga_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ga_Gatunek" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ga_Gatunek" Type="String" />
                    <asp:Parameter Name="Ga_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView10" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="To_ID,Wy_ID" DataSourceID="SqlDataSource10" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" ReadOnly="True" SortExpression="To_ID" />
                    <asp:BoundField DataField="Wy_ID" HeaderText="Wy_ID" ReadOnly="True" SortExpression="Wy_ID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [TowarWykonawca] WHERE [To_ID] = @To_ID AND [Wy_ID] = @Wy_ID" InsertCommand="INSERT INTO [TowarWykonawca] ([To_ID], [Wy_ID]) VALUES (@To_ID, @Wy_ID)" SelectCommand="SELECT * FROM [TowarWykonawca]">
                <DeleteParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Wy_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Wy_ID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
