using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public static class TrackReportGeneration
{
	public static void Add(string filename)
	{
        string username = HttpContext.Current.Session["userName"].ToString();
        string ILCID = HttpContext.Current.Session["ein"].ToString();
        string downloadTime = DateTime.Now.ToString();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ILCDBConnectionString"].ToString());
        SqlDataReader dr;
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO tblUserDownload ([username],[ILCID],[FileName],[DownloadTime]) VALUES (@username, @ILCID, @FileName, @DownloadTime)", con);
        cmd.Parameters.AddWithValue("username", username);
        cmd.Parameters.AddWithValue("ILCID", ILCID);
        cmd.Parameters.AddWithValue("FileName", filename);
        cmd.Parameters.AddWithValue("DownloadTime", downloadTime);
        cmd.ExecuteNonQuery();
        con.Close();
	}
}