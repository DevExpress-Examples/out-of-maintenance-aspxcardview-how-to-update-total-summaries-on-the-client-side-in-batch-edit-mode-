<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OnBatchEditEndEditing(s, e) {
            var originalValue = s.batchEditApi.GetCellValue(e.visibleIndex, "UnitPrice");
            var newValue = e.cardValues[(s.GetColumnByField("UnitPrice").index)].value;

            var dif = newValue - originalValue;
            labelSum.SetValue((parseFloat(labelSum.GetValue()) + dif).toFixed(1));

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ProductID">
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Settings ShowTitlePanel="true"  />
            <Templates>
                <TitlePanel>
                    Sum =
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="labelSum" Text='<%#GetTotalSummaryValue()%>'>
                    </dx:ASPxLabel>    
                </TitlePanel>
            </Templates>
            <Columns>
                <dx:CardViewTextColumn FieldName="ProductID" ReadOnly="True" Visible="False">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="ProductName" VisibleIndex="0">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="UnitPrice" VisibleIndex="1">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="UnitsInStock" VisibleIndex="2">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="UnitsOnOrder" VisibleIndex="3">
                </dx:CardViewTextColumn>
            </Columns>
            <ClientSideEvents BatchEditEndEditing="OnBatchEditEndEditing" />
        <TotalSummary>
            <dx:ASPxCardViewSummaryItem SummaryType="Sum" FieldName="UnitPrice" />
        </TotalSummary>
        </dx:ASPxCardView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\nwind.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products] WHERE [ProductName]='Chai' OR [ProductName]='Chang' OR [ProductName] = 'Aniseed Syrup'" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitPrice] = ?, [UnitsInStock] = ?, [UnitsOnOrder] = ? WHERE [ProductID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="UnitsInStock" Type="Int16" />
                <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="UnitsInStock" Type="Int16" />
                <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>