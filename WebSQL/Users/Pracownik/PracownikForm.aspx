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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Kl_ID" DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Kl_ID" HeaderText="Kl_ID" InsertVisible="False" ReadOnly="True" SortExpression="Kl_ID" Visible="False" />
                <asp:BoundField DataField="Kl_Imie" HeaderText="Kl_Imie" SortExpression="Kl_Imie" />
                <asp:BoundField DataField="Kl_Nazwisko" HeaderText="Kl_Nazwisko" SortExpression="Kl_Nazwisko" />
                <asp:BoundField DataField="Kl_Pesel" HeaderText="Kl_Pesel" SortExpression="Kl_Pesel" />
                <asp:BoundField DataField="Kl_Mail" HeaderText="Kl_Mail" SortExpression="Kl_Mail" />
                <asp:BoundField DataField="Kl_Adres" HeaderText="Kl_Adres" SortExpression="Kl_Adres" />
            </Columns>
            
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" DeleteCommand="DELETE FROM [Klienci] WHERE [Kl_ID] = @Kl_ID" InsertCommand="INSERT INTO [Klienci] ([Kl_Imie], [Kl_Nazwisko], [Kl_Pesel], [Kl_Mail], [Kl_Adres]) VALUES (@Kl_Imie, @Kl_Nazwisko, @Kl_Pesel, @Kl_Mail, @Kl_Adres)" SelectCommand="SELECT * FROM [Klienci]" UpdateCommand="UPDATE [Klienci] SET [Kl_Imie] = @Kl_Imie, [Kl_Nazwisko] = @Kl_Nazwisko, [Kl_Pesel] = @Kl_Pesel, [Kl_Mail] = @Kl_Mail, [Kl_Adres] = @Kl_Adres WHERE [Kl_ID] = @Kl_ID">
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
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,CzyZrealizowano" DataSourceID="SqlDataSource2" Height="138px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                    <asp:BoundField DataField="IloscTowaru" HeaderText="IloscTowaru" SortExpression="IloscTowaru" />
                    <asp:BoundField DataField="CenaZakupu" HeaderText="CenaZakupu" SortExpression="CenaZakupu" />
                    <asp:BoundField DataField="KlImie" HeaderText="KlImie" SortExpression="KlImie" />
                    <asp:BoundField DataField="KlNazwisko" HeaderText="KlNazwisko" SortExpression="KlNazwisko" />
                    <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                    <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" />
                    <asp:BoundField DataField="Kupione Dnia" HeaderText="Kupione Dnia" ReadOnly="True" SortExpression="Kupione Dnia" />
                    <asp:BoundField DataField="Realizacja na" HeaderText="Realizacja na" ReadOnly="True" SortExpression="Realizacja na" />
                    <asp:CheckBoxField DataField="CzyZrealizowano" HeaderText="CzyZrealizowano" SortExpression="CzyZrealizowano" />
                    <asp:BoundField DataField="PrImie" HeaderText="PrImie" SortExpression="PrImie" />
                    <asp:BoundField DataField="PrNazwisko" HeaderText="PrNazwisko" SortExpression="PrNazwisko" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" 
                SelectCommand="SELECT Zamowienia.Za_ID AS ID, Towar.To_Nazwa AS Nazwa, ListaTowarow.Li_IloscTowaru AS IloscTowaru, ListaTowarow.Li_Cena_Zakupu AS CenaZakupu, Klienci.Kl_Imie AS KlImie, Klienci.Kl_Nazwisko AS KlNazwisko, Klienci.Kl_Mail AS Mail, Klienci.Kl_Adres AS Adres, LEFT (Zamowienia.Za_KiedyKupione, 11) AS 'Kupione Dnia', LEFT (Zamowienia.Za_NaKiedy, 11) AS 'Realizacja na', Zamowienia.Za_CzyZrealizowano AS CzyZrealizowano, Pracownicy.Pr_Imie AS PrImie, Pracownicy.Pr_Nazwisko AS PrNazwisko FROM Zamowienia INNER JOIN Klienci ON Zamowienia.Kl_ID = Klienci.Kl_ID INNER JOIN Pracownicy ON Zamowienia.Pr_ID = Pracownicy.Pr_ID INNER JOIN ListaTowarow ON Zamowienia.Za_ID = ListaTowarow.Za_ID INNER JOIN Towar ON ListaTowarow.To_ID = Towar.To_ID" 
                UpdateCommand="update SklepMuzycznyV2.dbo.Zamowienia set Za_CzyZrealizowano = @CzyZrealizowano  where Za_ID=@ID">
                <UpdateParameters>
                    <asp:Parameter Name="CzyZrealizowano" Type="Byte" />
                    <asp:Parameter Name="ID" Type="Int32"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Za_ID" DataSourceID="SqlDataSource5" Visible="False">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Za_ID" HeaderText="Za_ID" InsertVisible="False" ReadOnly="True" SortExpression="Za_ID" />
                    <asp:CheckBoxField DataField="Za_CzyZrealizowano" HeaderText="Za_CzyZrealizowano" SortExpression="Za_CzyZrealizowano" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" OnUpdated="SqlDataSource5_Updated" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" 
                DeleteCommand="DELETE FROM [Zamowienia] WHERE [Za_ID] = @Za_ID" 
                InsertCommand="INSERT INTO [Zamowienia] ([Za_CzyZrealizowano]) VALUES (@Za_CzyZrealizowano)" 
                SelectCommand="SELECT [Za_ID], [Za_CzyZrealizowano] FROM [Zamowienia] WHERE ([Za_ID] = @Za_ID)" 
                UpdateCommand="UPDATE [Zamowienia] SET [Za_CzyZrealizowano] = @Za_CzyZrealizowano WHERE [Za_ID] = @Za_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Za_CzyZrealizowano" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Za_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Za_CzyZrealizowano" Type="Boolean" />
                    <asp:Parameter Name="Za_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="To_ID" DataSourceID="SqlDataSource3" Visible="False">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" InsertVisible="False" ReadOnly="True" SortExpression="To_ID" Visible="False" />
                    <asp:BoundField DataField="To_CenaAktualna" HeaderText="To_CenaAktualna" SortExpression="To_CenaAktualna" />
                    <asp:BoundField DataField="To_IloscNaStanie" HeaderText="To_IloscNaStanie" SortExpression="To_IloscNaStanie" />
                    <asp:BoundField DataField="To_Nazwa" HeaderText="To_Nazwa" SortExpression="To_Nazwa" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" 
                DeleteCommand="DELETE FROM [Towar] WHERE [To_ID] = @To_ID" 
                InsertCommand="INSERT INTO [Towar] ([To_CenaAktualna], [To_IloscNaStanie], [To_Nazwa]) VALUES (@To_CenaAktualna, @To_IloscNaStanie, @To_Nazwa)" 
                SelectCommand="SELECT [To_ID], [To_CenaAktualna], [To_IloscNaStanie], [To_Nazwa] FROM [Towar]"
                UpdateCommand="UPDATE [Towar] SET [To_CenaAktualna] = @To_CenaAktualna, [To_IloscNaStanie] = @To_IloscNaStanie, [To_Nazwa] = @To_Nazwa WHERE [To_ID] = @To_ID">
                <DeleteParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="To_CenaAktualna" Type="Decimal" />
                    <asp:Parameter Name="To_IloscNaStanie" Type="Int32" />
                    <asp:Parameter Name="To_Nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="To_CenaAktualna" Type="Decimal" />
                    <asp:Parameter Name="To_IloscNaStanie" Type="Int32" />
                    <asp:Parameter Name="To_Nazwa" Type="String" />
                    <asp:Parameter Name="To_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Ut_ID" DataSourceID="SqlDataSource4" Visible="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Ut_ID" HeaderText="Ut_ID" InsertVisible="False" ReadOnly="True" SortExpression="Ut_ID" Visible="False" />
                    <asp:BoundField DataField="To_ID" HeaderText="To_ID" SortExpression="To_ID"/>
                    <asp:BoundField DataField="Ut_Name" HeaderText="Ut_Name" SortExpression="Ut_Name" />
                    <asp:BoundField DataField="Ut_CzasUtworu" HeaderText="Ut_CzasUtworu" SortExpression="Ut_CzasUtworu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SklepMuzycznyV2ConnectionString %>" 
                DeleteCommand="DELETE FROM [Utwor] WHERE [Ut_ID] = @Ut_ID" 
                InsertCommand="INSERT INTO [Utwor] ([To_ID], [Ut_Name], [Ut_CzasUtworu]) VALUES (@To_ID, @Ut_Name, @Ut_CzasUtworu)" 
                SelectCommand="SELECT * FROM [Utwor] WHERE ([To_ID] = @To_ID)" 
                UpdateCommand="UPDATE [Utwor] SET [Ut_Name] = @Ut_Name, [Ut_CzasUtworu] = @Ut_CzasUtworu WHERE [Ut_ID] = @Ut_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Ut_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Ut_Name" Type="String" />
                    <asp:Parameter Name="Ut_CzasUtworu" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView3" Name="To_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="To_ID" Type="Int32" />
                    <asp:Parameter Name="Ut_Name" Type="String" />
                    <asp:Parameter Name="Ut_CzasUtworu" Type="DateTime" />
                    <asp:Parameter Name="Ut_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
