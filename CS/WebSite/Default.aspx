<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="Grid1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="0" />
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1" />
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2" />
            </Columns>
        </dx:ASPxGridView>
        <br />
        <dx:ASPxGridView ID="Grid2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="AccessDataSource2" KeyFieldName="EmployeeID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="0" />
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1" />
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2" />
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3" />
            </Columns>
        </dx:ASPxGridView>

        <dx:ASPxButton ID="ExportButton" runat="server" Text="Export both grids" Width="205px" 
            OnClick="ExportButton_Click" />

        <dx:ASPxGridViewExporter ID="GridExporter1" runat="server" GridViewID="Grid1" />
        <dx:ASPxGridViewExporter ID="GridExporter2" runat="server" GridViewID="Grid2" />

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" 
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" />
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb" 
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]" />
    </form>
</body>
</html>
