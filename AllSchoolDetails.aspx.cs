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
public partial class AllSchoolDetails : System.Web.UI.Page
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
            addUser.Visible = true;
            user.InnerText = "SESIP-Admin";
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
        }

        if (IsPostBack)
        {
            rprt.Load(Server.MapPath("~/rptAllSchool.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand("SP_ILC_Details_ALL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crvAllSchool.ReportSource = rprt;
        }
        else
        {
            rprt.Load(Server.MapPath("~/rptAllSchool.rpt"));
            rprt.SetDatabaseLogon("sa", "sqladmin", "103.234.26.37", "SESIP", true);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand("SP_ILC_Details_ALL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            rprt.SetDataSource(ds);
            crvAllSchool.ReportSource = rprt;
        }
    }
        protected void logoutLB_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}