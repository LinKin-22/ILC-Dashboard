using System;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
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
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        SqlCommand cmd;
        int number = 10;
        con.Open();
        string output = "";
        string status = "";
        string ID = "";
        string active = "";

        string FetchData = "Select * from Location";
        cmd = new SqlCommand(FetchData, con);
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {

            output = output + dr[2].ToString() + "," + dr[3].ToString() + "," + dr[4].ToString() + ",";
            status = status + dr[6].ToString() + ",";
            ID = ID + dr[0].ToString() + ",";
            active = active + dr[7].ToString() + ",";
        }
        active = active.Remove(active.Length - 1);
        ID = ID.Remove(ID.Length - 1);
        status = status.Remove(status.Length - 1);
        output = output.Remove(output.Length - 1);
        information.InnerText = output;
        st.InnerText = status;
        ilcid.InnerText = ID;
        activepc.InnerText = active;
    }
    protected void logoutLB_Click(object sender, EventArgs e)
    {
        
        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}