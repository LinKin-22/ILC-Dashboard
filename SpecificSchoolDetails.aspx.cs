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


public partial class SpecificSchoolDetails : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType = "";
        string ilcid = "";
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            addInfoLink.Visible = true;
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
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
            ilcid = Session["ein"].ToString();
        }

        if(!IsPostBack)
        {
            
        }
        else
        {
            string schoolName = ilcNameDDL.SelectedValue.ToString();
            string ILCID = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlDataReader dr;
            SqlCommand cmd;
            con.Open();
            string query = "SELECT * FROM ILCInfo WHERE SchoolName = '" + schoolName + "'";
            cmd = new SqlCommand(query, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ILCID = dr[0].ToString();
            }
            Session["ILCID"] = ILCID;
            con.Close();
            rprt.Load(Server.MapPath("~/rptILCInfo.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmdRpt = new SqlCommand("SP_ILC_Details_Information_Specific", conRpt);
            cmdRpt.CommandType = CommandType.StoredProcedure;
            cmdRpt.Parameters.AddWithValue("@vILCID", ILCID);
            SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crv.ReportSource = rprt;
            ParameterField field1 = this.crv.ParameterFieldInfo[0];
            ParameterDiscreteValue val1 = new ParameterDiscreteValue();
            val1.Value = ILCID;
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
        TrackReportGeneration.Add("Specific School Details Report");
        string schoolName = ilcNameDDL.SelectedValue.ToString();
        string ILCID = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        SqlCommand cmd;
        con.Open();
        string query = "SELECT * FROM ILCInfo WHERE SchoolName = '" + schoolName + "'";
        cmd = new SqlCommand(query, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            ILCID = dr[0].ToString();
        }
        Session["ILCID"] = ILCID;
        con.Close();
        rprt.Load(Server.MapPath("~/rptILCInfo.rpt"));
        rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
        SqlConnection conRpt = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlCommand cmdRpt = new SqlCommand("SP_ILC_Details_Information_Specific", conRpt);
        cmdRpt.CommandType = CommandType.StoredProcedure;
        cmdRpt.Parameters.AddWithValue("@vILCID", ILCID);
        SqlDataAdapter sda = new SqlDataAdapter(cmdRpt);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        rprt.SetDataSource(ds);
        crv.ReportSource = rprt;
        ParameterField field1 = this.crv.ParameterFieldInfo[0];
        ParameterDiscreteValue val1 = new ParameterDiscreteValue();
        val1.Value = ILCID;
        field1.CurrentValues.Add(val1);
    }
}