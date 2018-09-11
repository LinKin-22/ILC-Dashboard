using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using System.Data;

public partial class DivWiseILCStatusForToday : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType = "";
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            userType = Session["userType"].ToString();
        }
        if (userType == null)
        {
            Response.Redirect("Default.aspx");
        }
        else if (userType == "1")
        {
            user.InnerText = "SESIP-Admin";
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
            Response.Redirect("UserHome.aspx");
        }
        if(!IsPostBack)
        {

        }
                else
        {
            string divisionName = ilcDivisionDDL.SelectedValue.ToString();

            rprt.Load(Server.MapPath("~/rptDivisionWiseTodaysILCReport.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmdRpt = new SqlCommand("SP_ILC_Server_Active_Status_Division", conRpt);
            cmdRpt.CommandType = CommandType.StoredProcedure;
            cmdRpt.Parameters.AddWithValue("@vDivCode", divisionName);
            SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crv.ReportSource = rprt;
            ParameterField field1 = this.crv.ParameterFieldInfo[0];
            ParameterDiscreteValue val1 = new ParameterDiscreteValue();
            val1.Value = divisionName;
            field1.CurrentValues.Add(val1);
        }
    }
    protected void logoutLB_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void rptBTN_Click(object sender, EventArgs e)
    {
        TrackReportGeneration.Add("Division wise wise ILC Status");
        string divisionName = ilcDivisionDDL.SelectedValue.ToString();

        rprt.Load(Server.MapPath("~/rptDivisionWiseTodaysILCReport.rpt"));
        rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
        SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlCommand cmdRpt = new SqlCommand("SP_ILC_Server_Active_Status_Division", conRpt);
        cmdRpt.CommandType = CommandType.StoredProcedure;
        cmdRpt.Parameters.AddWithValue("@vDivCode", divisionName);
        SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        rprt.SetDataSource(ds);
        crv.ReportSource = rprt;
        ParameterField field1 = this.crv.ParameterFieldInfo[0];
        ParameterDiscreteValue val1 = new ParameterDiscreteValue();
        val1.Value = divisionName;
        field1.CurrentValues.Add(val1);
    }
}