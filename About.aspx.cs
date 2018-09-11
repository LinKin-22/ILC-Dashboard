using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
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
            addUser.Visible = true;
            user.InnerText = "SESIP-Admin";
        }
        else if (userType == "2")
        {
            user.InnerText = Session["userName"].ToString();
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