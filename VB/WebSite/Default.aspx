<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
		<dxwgv:ASPxGridView ID="Grid1" runat="server" AutoGenerateColumns="False" 
			DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
			<Columns>
				<dxwgv:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="0" />
				<dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1" />
				<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2" />
			</Columns>
		</dxwgv:ASPxGridView>
		<br />
		<dxwgv:ASPxGridView ID="Grid2" runat="server" AutoGenerateColumns="False" 
			DataSourceID="AccessDataSource2" KeyFieldName="EmployeeID">
			<Columns>
				<dxwgv:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="0" />
				<dxwgv:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1" />
				<dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2" />
				<dxwgv:GridViewDataTextColumn FieldName="Title" VisibleIndex="3" />
			</Columns>
		</dxwgv:ASPxGridView>

		<dxe:ASPxButton ID="ExportButton" runat="server" Text="Export both grids" Width="205px" 
			OnClick="ExportButton_Click" />

		<dxwgv:ASPxGridViewExporter ID="GridExporter1" runat="server" GridViewID="Grid1" />
		<dxwgv:ASPxGridViewExporter ID="GridExporter2" runat="server" GridViewID="Grid2" />

		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" 
			SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" />
		<asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb" 
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]" />
	</form>
</body>
</html>