Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Function GetTotalSummaryValue() As Object
        Dim summaryItem As ASPxCardViewSummaryItem = ASPxCardView1.TotalSummary.First(Function(i) i.FieldName = "UnitPrice")
        Return ASPxCardView1.GetTotalSummaryValue(summaryItem)
    End Function
    Protected Sub ASPxLabel1_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim label = DirectCast(sender, ASPxLabel)
        label.DataBind()
    End Sub
End Class