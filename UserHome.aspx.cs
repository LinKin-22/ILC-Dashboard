using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserHome : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType="";
        if(Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            userName.Text = Session["userName"].ToString();
            userType = Session["userType"].ToString();
            
        }
        if (userType == null)
        {
            Response.Redirect("Default.aspx");
        }
        else if (userType == "1")
        {
            user.InnerText = "SESIP-Admin";
            addUser.Visible = true;
            allSchoolTR.Visible = true;
            specificSchoolTR.Visible = true;
            currentILCStatusTR.Visible = true;
            CurrentSpecificILCStatusTR.Visible = true;
            dateWiseILCStatusTR.Visible = true;
            distWiseTodaysILCStatusTR.Visible = true;
            divWiseTodaysILCStatusTR.Visible = true;
            ilcRankingTR.Visible = true;
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
            allSchoolTR.Visible = true;
            specificSchoolTR.Visible = true;
            CurrentSpecificILCStatusTR.Visible = true;
            dateWiseILCStatusTR.Visible = true;
        }
    }
    protected void rptAllSchoolBTN_Click(object sender, EventArgs e)
    {
        string filename = "All School Report";
        TrackReportGeneration.Add(filename);
        Response.Redirect("AllSchoolDetails.aspx");
    }
    protected void logoutLB_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }

    protected void rptSpecificSchoolBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("SpecificSchoolDetails.aspx");
    }
    protected void rptDateWiseILCStatusBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("DateWiseILCStatus.aspx");
    }
    protected void rptDistWiseTodaysILCStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("DistWiseILCStatusForToday.aspx");
    }
    protected void rptDivWiseTodaysILCStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("DivWiseILCStatusForToday.aspx");
    }
    protected void rptCurrentILCStatusBTN_Click(object sender, EventArgs e)
    {
        TrackReportGeneration.Add("Current ILC Status of All School");
        Response.Redirect("CurrentILCStatus.aspx");
    }
    protected void rptCurrentSpecificILCStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("CurrentSpecificILCStatus.aspx");
    }
    protected void rptILCRanking_Click(object sender, EventArgs e)
    {
        TrackReportGeneration.Add("ILC Ranking");
        Response.Redirect("ILCRanking.aspx");
    }
}