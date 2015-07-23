using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Products : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    //BtnSearch_Click(sender,e);
    if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
      Response.Redirect("adminLogin.aspx");
    binddata();


  }
  protected void BtnSearch_Click(object sender, EventArgs e)
  {
    String type = DDLKeyType.SelectedValue;
    Session["keyword"] = TBKeyWord.Text;
    if (type.Equals("商品名称"))
      type = "ModelName";
    else if (type.Equals("商品编号"))
      type = "ModelNumber";
    else
      type = "";

    Session["sql"] = "select * from Products where " + type + " like '%" + Session["keyword"] + "%'";

    binddata();
  }

  private void binddata()
  {
    if (Session["keyword"] == null)
      return;
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = (String)Session["sql"];
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Products");

    GridView1.DataSource = ds.Tables["Products"].DefaultView;
    GridView1.DataBind();
    conn.Close();

    //TBKeyWord.Text = (String)Session["keyword"];
  }



  protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
  {

  }

  // 翻页
  protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    GridView1.PageIndex = e.NewPageIndex;
    //BtnSearch_Click(sender,e);
    binddata();
  }



  protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      String id = DataBinder.Eval(e.Row.DataItem, "ProductId").ToString();
      String comm = DataBinder.Eval(e.Row.DataItem, "Commend").ToString();
      if (comm == "False")
      {
        e.Row.Cells[5].Text = "<a href=\"ProductCommend.aspx?ProductId=" + id + "&Commend=" + comm + "\">推荐</a>";
      }
      else
        e.Row.Cells[5].Text = "<a href=\"ProductCommend.aspx?ProductId=" + id + "&Commend=" + comm + "\">取消推荐</a>";
    }
  }
}
