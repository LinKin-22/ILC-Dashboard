using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType="";
        if(Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            loginLink.Visible = false;
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
            Response.Redirect("Default.aspx");
            user.InnerText = Session["userName"].ToString();
        }
    }
    protected void registerBTN_Click(object sender, EventArgs e)
    {
        string ein = einTB.Text;
        string username = usernameTB.Text;
        string phone = phoneTB.Text;
        string email = emailTB.Text;
        string password = passwordTB.Text;
        string usertype = "2";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        con.Open();

        SqlCommand cmd = new SqlCommand("INSERT INTO [tblUser] ([username],[password],[phone],[email],[ILCID],[userType]) VALUES (@username, @password, @phone, @email, @ILCID, @userType)", con);
        cmd.Parameters.AddWithValue("username", username);
        cmd.Parameters.AddWithValue("password", password);
        cmd.Parameters.AddWithValue("phone", phone);
        cmd.Parameters.AddWithValue("email", email);
        cmd.Parameters.AddWithValue("ILCID", ein);
        cmd.Parameters.AddWithValue("userType", usertype);
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
    }

    protected void clear()
    {
        einTB.Text = "";
        usernameTB.Text = "";
        phoneTB.Text = "";
        emailTB.Text = "";
        passwordTB.Text = "";
        reTypePasswordTB.Text = "";

    }
}