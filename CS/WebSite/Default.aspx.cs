using System;
using System.IO;
using System.Web.UI;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrintingLinks;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void ExportButton_Click(object sender, EventArgs e) {
        PrintingSystem ps = new PrintingSystem();

        PrintableComponentLink link1 = new PrintableComponentLink(ps);
        link1.Component = GridExporter1;

        PrintableComponentLink link2 = new PrintableComponentLink(ps);
        link2.Component = GridExporter2;

        CompositeLink compositeLink = new CompositeLink(ps);
        compositeLink.Links.AddRange(new object[] { link1, link2 });

        compositeLink.CreateDocument();
        using(MemoryStream stream = new MemoryStream()) {
            compositeLink.PrintingSystem.ExportToXls(stream);
            WriteToResponse("filename", true, "xls", stream);
        }
        ps.Dispose();
    }
    void WriteToResponse(string fileName, bool saveAsFile, string fileFormat, MemoryStream stream) {
        if(Page == null || Page.Response == null)
            return;
        string disposition = saveAsFile ? "attachment" : "inline";
        Page.Response.Clear();
        Page.Response.Buffer = false;
        Page.Response.AppendHeader("Content-Type", string.Format("application/{0}", fileFormat));
        Page.Response.AppendHeader("Content-Transfer-Encoding", "binary");
        Page.Response.AppendHeader("Content-Disposition", 
            string.Format("{0}; filename={1}.{2}", disposition, fileName, fileFormat));
        Page.Response.BinaryWrite(stream.GetBuffer());
        Page.Response.End();
    }
}
