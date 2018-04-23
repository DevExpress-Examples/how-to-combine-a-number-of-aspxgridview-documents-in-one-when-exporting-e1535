using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.XtraPrintingLinks;
using DevExpress.XtraPrinting;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxButton1_Click(object sender, EventArgs e) {
        DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink link1 = new DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink(ASPxGridViewExporter1);
        DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink link2 = new DevExpress.Web.ASPxGridView.Export.Helper.GridViewLink(ASPxGridViewExporter2);

        CompositeLink composite = new CompositeLink(new PrintingSystem());

        composite.Links.AddRange(new object[] { link1, link2 });
        composite.CreateDocument();

        System.IO.MemoryStream stream = new System.IO.MemoryStream();
        composite.PrintingSystem.ExportToXls(stream);
        WriteToResponse("filename", true, "xls", stream);
    }

    protected void WriteToResponse(string fileName, bool saveAsFile, string fileFormat, System.IO.MemoryStream stream) {
        if (Page == null || Page.Response == null) return;
        string disposition = saveAsFile ? "attachment" : "inline";
        Page.Response.Clear();
        Page.Response.Buffer = false;
        Page.Response.AppendHeader("Content-Type", string.Format("application/{0}", fileFormat));
        Page.Response.AppendHeader("Content-Transfer-Encoding", "binary");
        Page.Response.AppendHeader("Content-Disposition", string.Format("{0}; filename={1}.{2}", disposition, fileName, fileFormat));
        Page.Response.BinaryWrite(stream.GetBuffer());
        Page.Response.End();
    }
}
