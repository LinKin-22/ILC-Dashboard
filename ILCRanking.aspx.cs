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

public partial class ILCRankingTest : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();
    string userType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        datePickerFrom.Attributes.Add("autocomplete", "off");
        datePickerTo.Attributes.Add("autocomplete", "off");
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
            //Getting the input values from front-end
            string fromDate = datePickerFrom.Text;
            string toDate = datePickerTo.Text;

            rprt.Load(Server.MapPath("~/rptILCRanking.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmdRpt = new SqlCommand("SP_ILC_Ranking", conRpt);
            cmdRpt.CommandType = CommandType.StoredProcedure;
            cmdRpt.Parameters.AddWithValue("@vDateFrom", fromDate);
            cmdRpt.Parameters.AddWithValue("@vDateTo", toDate);
            SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crv.ReportSource = rprt;

            ParameterField field2 = this.crv.ParameterFieldInfo[0];
            ParameterDiscreteValue val2 = new ParameterDiscreteValue();
            val2.Value = fromDate;
            field2.CurrentValues.Add(val2);
            ParameterField field3 = this.crv.ParameterFieldInfo[1];
            ParameterDiscreteValue val3 = new ParameterDiscreteValue();
            val3.Value = toDate;
            field3.CurrentValues.Add(val3);
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
            //Getting the input values from front-end
            string fromDate = datePickerFrom.Text;
            string toDate = datePickerTo.Text;

            rprt.Load(Server.MapPath("~/rptILCRanking.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmdRpt = new SqlCommand("SP_ILC_Ranking", conRpt);
            cmdRpt.CommandType = CommandType.StoredProcedure;
            cmdRpt.Parameters.AddWithValue("@vDateFrom", fromDate);
            cmdRpt.Parameters.AddWithValue("@vDateTo", toDate);
            SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crv.ReportSource = rprt;

            ParameterField field2 = this.crv.ParameterFieldInfo[0];
            ParameterDiscreteValue val2 = new ParameterDiscreteValue();
            val2.Value = fromDate;
            field2.CurrentValues.Add(val2);
            ParameterField field3 = this.crv.ParameterFieldInfo[1];
            ParameterDiscreteValue val3 = new ParameterDiscreteValue();
            val3.Value = toDate;
            field3.CurrentValues.Add(val3);
    }
}