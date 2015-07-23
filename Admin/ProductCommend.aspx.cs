using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ProductCommend : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
      Response.Redirect("adminLogin.aspx");
    String id = Request.QueryString["ProductId"];
    String newcomm = Request.QueryString["Commend"];
    if (newcomm == "False")
      newcomm = "1";
    else
      newcomm = "0";
    String sql = "update Products set Commend='" + newcomm + "' where ProductId='" + id + "'";

    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();

    conn.Close();

    Response.Write("修改成功");

    Server.Transfer("Products.aspx");
  }
}
