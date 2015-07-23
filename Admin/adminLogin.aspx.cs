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
using System.Data.SqlClient;

public partial class Admin_adminLogin : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["admin"] != null && Request.Cookies["admin"]["name"] == "admin")
      Response.Redirect("admin.aspx");
  }
  protected void BtnLoginClick(object sender, EventArgs e)
  {
    String user = text_username.Value;
    String pass = pwd.Value;
    String sql = "select * from Admin";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    reader.Read();
    String username = reader.GetValue(1).ToString();
    String password = reader.GetValue(2).ToString();
    if (user == username && pass == password)
    {
      Response.Cookies["admin"]["name"] = user;
      Response.Redirect("admin.aspx");
    }
    else
    {
      Response.Write("用户名或密码错误");
    }
  }
}
