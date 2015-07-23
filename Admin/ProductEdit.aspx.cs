using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ProductEdit : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
        Response.Redirect("adminLogin.aspx");
      conn = new SqlConnection(StrConnection);
      conn.Open();
      String id = Request.QueryString["ProductId"];
      String sql = "select ModelName,Description,ProductImage,UnitCost,Discount from Products where ProductId='" + id + "'";
      cmd = new SqlCommand(sql, conn);
      SqlDataReader reader = cmd.ExecuteReader();
      reader.Read();
      text_name.Value = reader.GetValue(0).ToString();
      textarea_detail.Value = reader.GetValue(1).ToString();
      text_img.Value = reader.GetValue(2).ToString();
      text_price.Value = reader.GetValue(3).ToString();
      text_vipprice.Value = reader.GetValue(4).ToString();
      conn.Close();
    }
  }

  protected void AddBtnClick(object sender, EventArgs e)
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String id = Request.QueryString["ProductId"];
    String sql = "update Products set ModelName='" + text_name.Value +
        "',Description='" + textarea_detail.Value +
        "',ProductImage='" + text_img.Value +
        "',UnitCost='" + text_price.Value +
        "',Discount='" + text_vipprice.Value + "' where ProductId='" + id + "'";
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
    Response.Write("编辑成功");
  }
}
