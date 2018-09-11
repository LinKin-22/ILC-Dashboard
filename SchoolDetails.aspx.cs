using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class SchoolDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType = "";
        string userName = "";
        if (Session["userName"] != null)
        {
            userName = Session["userName"].ToString();
            userType = Session["userType"].ToString();
            loginLink.Visible = false;
            logoutLink.Visible = true;
            userHomeLink.Visible = true;
            addinfoLink.Visible = true;
        }
        if (userType == null)
        {
            user.InnerText = "";
        }
        else if (userType == "1")
        {
            user.InnerText = "SESIP-Admin";
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
        }
        string id = "";
        if(Request.QueryString["ID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            id = Request.QueryString["ID"];
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        SqlCommand cmd;
        con.Open();
        string ILCID = "";
        string schoolName = "";
        string schoolAddress = "";
        string headName = "";
        string headPhone = "";
        string headEmail = "";
        string trainerName = "";
        string trainerPhone = "";
        string trainerEmail = "";
        string query = "SELECT * FROM ILCInfo WHERE ILCID = " + id + "" ;

        cmd = new SqlCommand(query, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ILCID = dr[0].ToString();
            schoolName = dr[1].ToString();
            schoolAddress = dr[2].ToString();
            headName = dr[3].ToString();
            headPhone = dr[4].ToString();
            headEmail = dr[5].ToString();
            trainerName = dr[6].ToString();
            trainerPhone = dr[7].ToString();
            trainerEmail = dr[8].ToString();
        }
        con.Close();
        schoolnameH.InnerText = schoolName;
        schoolnameH2.InnerText = schoolName;
        ilcidH.InnerText = ILCID;
        addressTD.InnerHtml = schoolAddress;
        headNameTD.InnerHtml = headName;
        headPhoneTD.InnerHtml = headPhone;
        headEmailTD.InnerHtml = headEmail;
        trainerNameTD.InnerHtml = trainerName;
        trainerEmailTD.InnerHtml = trainerEmail;
        trainerPhoneTD.InnerHtml = trainerPhone;
    }
    protected void logoutLB_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }

    protected void backBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}