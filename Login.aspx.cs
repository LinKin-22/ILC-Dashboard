using System;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType = "";
        string userName = "";
        if (Session["userName"] != null)
        {
            userType = Session["userType"].ToString();
            userName = Session["userName"].ToString();
        }
        if (userType == "1")
        {
            user.InnerText = "SESIP-Admin";
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
        }
    }
    protected void submitBTN_Click(object sender, EventArgs e)
    {
        //Get input value
        string userName = usernameTB.Value;
        string password = passwordTB.Value;

        //Establish Database Connection
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        SqlCommand cmd;
        con.Open();
        string query = "SELECT * FROM tblUser WHERE username = '" + userName + "'";
        cmd = new SqlCommand(query, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if(password == dr[1].ToString())
            {
                    HttpContext.Current.Session.Add("userName", userName);
                    HttpContext.Current.Session.Add("userType", dr[2].ToString());
                    HttpContext.Current.Session.Add("ein", dr[5].ToString());
                    Response.Redirect("UserHome.aspx");
            }
        }
    }
}