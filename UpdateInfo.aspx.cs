using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class UpdateInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void searchBTN_Click(object sender, EventArgs e)
    {
        string searchID = searchSchoolIDTB.Text;
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
        string query = "SELECT * FROM ILCInfo WHERE ILCID = " + searchID + "";

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
        schoolNameTB.Text = schoolName;
        schoolIDTB.Text = ILCID;
        addressTB.Text = schoolAddress;
        headNameTB.Text = headName;
        headPhoneTB.Text = headPhone;
        headEmailTB.Text = headEmail;
        trainerNameTB.Text = trainerName;
        trainerPhoneTB.Text = trainerPhone;
        trainerEmailTB.Text = trainerEmail;
        schooldetails.Visible = true;
    }
    protected void updateBTN_Click(object sender, EventArgs e)
    {
        string searchID = searchSchoolIDTB.Text;
        string schoolName = schoolNameTB.Text;
        string schoolID = schoolIDTB.Text;
        string address = addressTB.Text;
        string headName = headNameTB.Text;
        string headPhone = headPhoneTB.Text;
        string headEmail = headEmailTB.Text;
        string trainerName = trainerNameTB.Text;
        string trainerPhone = trainerPhoneTB.Text;
        string trainerEmail = trainerEmailTB.Text;
        SqlConnection con = new SqlConnection("server=DDC-ICT; database=ILCDB; uid= sa;pwd=sqladmin");
        SqlDataReader dr;
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO ILCInfo VALUES (@SchoolName, @Address, @HeadmasterName, @HeadPhone, @HeadMail, @TrainerName, @TrainerPhone, @TrainerEmail) WHERE ILCID =" + searchID + "", con);
       // SqlCommand cmd = new SqlCommand("UPDATE [ILCInfo] SET [SchoolName] = @VALUES (@SchoolName, @Address, @HeadmasterName, @HeadPhone, @HeadMail, @TrainerName, @TrainerPhone, @TrainerEmail) WHERE ILCID =" + searchID + "", con);

        cmd.Parameters.AddWithValue("SchoolName", schoolName);
        cmd.Parameters.AddWithValue("Address", address);
        cmd.Parameters.AddWithValue("HeadmasterName", headName);
        cmd.Parameters.AddWithValue("HeadPhone", headPhone);
        cmd.Parameters.AddWithValue("HeadMail", headEmail);
        cmd.Parameters.AddWithValue("TrainerName", trainerName);
        cmd.Parameters.AddWithValue("TrainerPhone", trainerPhone);
        cmd.Parameters.AddWithValue("TrainerEmail", trainerEmail);
        cmd.ExecuteNonQuery();
        con.Close();
    }
}