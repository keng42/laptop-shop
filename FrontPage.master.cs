using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class FrontPage : System.Web.UI.MasterPage
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      CheckIfLogin();
      FalshLabCategories();
    }
  }
  protected void Logout(object sender, EventArgs e)
  {
    //Session["login"] = false;
    //Session["user"] = "";
    Response.Cookies["login"]["username"] = "";
    Response.Cookies["login"]["email"] = "";
    Response.Cookies["login"]["userid"] = "";
    Response.Cookies["login"].Expires = DateTime.MinValue;
    Response.Redirect("Default.aspx");
  }
  protected void CheckIfLogin()
  {
    //if ((Boolean)Session["Login"])
    //{
    //  UserBar.Text = "欢迎 " + (String)Session["user"];
    //  BtnLogout.Visible = true;
    //}
    //else
    //{
    //  UserBar.Text = "<a href=\"Login.aspx\">登陆</a>|<a href=\"Register.aspx\">注册</a>";
    //  BtnLogout.Visible = false;
    if (Request.Cookies["login"] == null || Request.Cookies["login"]["username"] == "")
    {
      UserBar.Text = "<a href=\"Login.aspx\">登陆</a>|<a href=\"Register.aspx\">注册</a>";
      BtnLogout.Visible = false;
    }
    else
    {
      UserBar.Text = "欢迎 " + Request.Cookies["login"]["username"] + " ";
      BtnLogout.Visible = true;
    }

  }

  private void FalshLabCategories()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select * from Categories";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Categories");

    for (int i = 0; i < ds.Tables["Categories"].Rows.Count; i++)
    {
      string cate = ds.Tables["Categories"].Rows[i][1].ToString();
      string id = ds.Tables["Categories"].Rows[i][0].ToString();
      cate = "<a href=\"ProductsTop.aspx?CateId=" + id + "&Type=CategoryId\">" + cate + "</a>";
      LabCategories.Text += cate + " ";
    }
    conn.Close();
  }
  protected void gosearch(object sender, EventArgs e)
  {
    Server.Transfer("SearchProducts.aspx?Keyword=" + TxtSearch.Value);
  }
}
