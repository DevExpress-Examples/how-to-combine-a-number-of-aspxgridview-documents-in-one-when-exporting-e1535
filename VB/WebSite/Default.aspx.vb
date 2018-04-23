Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.XtraPrintingLinks
Imports DevExpress.XtraPrinting

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim link1 As New DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink(ASPxGridViewExporter1)
		Dim link2 As New DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink(ASPxGridViewExporter2)

		Dim composite As New CompositeLink(New PrintingSystem())

		composite.Links.AddRange(New Object() { link1, link2 })
		composite.CreateDocument()

		Dim stream As New System.IO.MemoryStream()
		composite.PrintingSystem.ExportToXls(stream)
		WriteToResponse("filename", True, "xls", stream)
	End Sub

	Protected Sub WriteToResponse(ByVal fileName As String, ByVal saveAsFile As Boolean, ByVal fileFormat As String, ByVal stream As System.IO.MemoryStream)
		If Page Is Nothing OrElse Page.Response Is Nothing Then
			Return
		End If
		Dim disposition As String
		If saveAsFile Then
			disposition = "attachment"
		Else
			disposition = "inline"
		End If
		Page.Response.Clear()
		Page.Response.Buffer = False
		Page.Response.AppendHeader("Content-Type", String.Format("application/{0}", fileFormat))
		Page.Response.AppendHeader("Content-Transfer-Encoding", "binary")
		Page.Response.AppendHeader("Content-Disposition", String.Format("{0}; filename={1}.{2}", disposition, fileName, fileFormat))
		Page.Response.BinaryWrite(stream.GetBuffer())
		Page.Response.End()
	End Sub
End Class
