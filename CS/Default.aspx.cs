using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected object GetTotalSummaryValue()
    {
        ASPxCardViewSummaryItem summaryItem = ASPxCardView1.TotalSummary.First(i => i.FieldName == "UnitPrice");
        return ASPxCardView1.GetTotalSummaryValue(summaryItem);
    }
    protected void ASPxLabel1_Init(object sender, EventArgs e)
    {
        var label = (ASPxLabel)sender;
        label.DataBind();
    }
}