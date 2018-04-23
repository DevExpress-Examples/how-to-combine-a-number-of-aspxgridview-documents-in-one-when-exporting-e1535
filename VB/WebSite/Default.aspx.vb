Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Web.UI
Imports DevExpress.XtraPrinting
Imports DevExpress.XtraPrintingLinks

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ExportButton_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim ps As New PrintingSystem()

		Dim link1 As New PrintableComponentLink(ps)
		link1.Component = GridExporter1

		Dim link2 As New PrintableComponentLink(ps)
		link2.Component = GridExporter2

		Dim compositeLink As New CompositeLink(ps)
		compositeLink.Links.AddRange(New Object() { link1, link2 })

		compositeLink.CreateDocument()
		Using stream As New MemoryStream()
			compositeLink.PrintingSystem.ExportToXls(stream)
			WriteToResponse("filename", True, "xls", stream)
		End Using
		ps.Dispose()
	End Sub
	Private Sub WriteToResponse(ByVal fileName As String, ByVal saveAsFile As Boolean, ByVal fileFormat As String, ByVal stream As MemoryStream)
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
