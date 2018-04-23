<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
        </dxwgv:ASPxGridView>
        <br />
        <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource2" KeyFieldName="EmployeeID">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
        </dxwgv:ASPxGridView>
        <dxwgv:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
        </dxwgv:ASPxGridViewExporter>
        <dxwgv:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="ASPxGridView2">
        </dxwgv:ASPxGridViewExporter>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]"></asp:AccessDataSource>
    </div>
        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Export both grids" Width="205px" OnClick="ASPxButton1_Click">
        </dxe:ASPxButton>
    </form>
</body>
</html>
