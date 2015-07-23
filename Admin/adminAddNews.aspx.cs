using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_adminAddNews : System.Web.UI.Page
{
    String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
    SqlConnection conn;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
        Response.Redirect("adminLogin.aspx");
    }
    protected void BtnSendClick(object sender, EventArgs e)
    {
        //Server.Transfer("addNewsResult.aspx");
        String title, isdel, memo, time, userid;
        title = text_title.Value;
        memo = ta_content.Value;
        time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        userid = select_menu.SelectedIndex.ToString();
        isdel = "false";

        conn = new SqlConnection(StrConnection);
        conn.Open();
        String sql = "insert into News values ('" + title + "','" + isdel + "','" + memo + "','" + time + "','" + userid + "');";
        cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();

        text_title.Value = "";
        ta_content.Value = "";
        select_menu.SelectedIndex = -1;
    }
}
