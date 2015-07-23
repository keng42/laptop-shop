using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_adminChangePwd : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
      Response.Redirect("adminLogin.aspx");
  }
  protected void BtnSave_Click(object sender, EventArgs e)
  {
    String oldP = TBOldPwd.Value;
    String newP = TBNewPwd.Value;
    String sql = "select * from Admin";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    reader.Read();
    if (oldP == reader.GetValue(2).ToString())
    {
      reader.Close();
      sql = "update Admin set adminPass='" + newP + "' where adminId=1";
      cmd = new SqlCommand(sql, conn);
      cmd.ExecuteNonQuery();
    }
    else
    {
      Response.Write("原密码错误");
    }
    conn.Close();
  }
}
