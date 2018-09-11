using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class AddInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userType = "";
        string userName = "";
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            userName = Session["userName"].ToString();
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
    }
    protected void submitBTN_Click(object sender, EventArgs e)
    {
        string schoolName = schoolNameTB.Text;
        string schoolID = schoolIDTB.Text;
        string address = addressTB.Text;
        string headName = headNameTB.Text;
        string headPhone = headPhoneTB.Text;
        string headEmail = headEmailTB.Text;
        string trainerName = trainerNameTB.Text;
        string trainerPhone = trainerPhoneTB.Text;
        string trainerEmail = trainerEmailTB.Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO ILCInfo ([ILCID],[SchoolName],[SchoolAddress],[HeadmasterName],[HeadPhone],[HeadMail],[TrainerName],[TrainerPhone],[TrainerEmail]) VALUES (@ILCID, @SchoolName, @SchoolAddress, @HeadmasterName, @HeadPhone, @HeadMail, @TrainerName, @TrainerPhone, @TrainerEmail)", con);
        cmd.Parameters.AddWithValue("ILCID", schoolID);
        cmd.Parameters.AddWithValue("SchoolName", schoolName);
        cmd.Parameters.AddWithValue("SchoolAddress", address);
        cmd.Parameters.AddWithValue("HeadmasterName", headName);
        cmd.Parameters.AddWithValue("HeadPhone", headPhone);
        cmd.Parameters.AddWithValue("HeadMail", headEmail);
        cmd.Parameters.AddWithValue("TrainerName", trainerName);
        cmd.Parameters.AddWithValue("TrainerPhone", trainerPhone);
        cmd.Parameters.AddWithValue("TrainerEmail", trainerEmail);
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
    }

    protected void clear()
    {
        schoolNameTB.Text = "";
        schoolIDTB.Text = "";
        addressTB.Text = "";
        headNameTB.Text = "";
        headPhoneTB.Text = "";
        headEmailTB.Text = "";
        trainerNameTB.Text = "";
        trainerPhoneTB.Text = "";
        trainerEmailTB.Text = "";
    }
    protected void logoutLB_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}