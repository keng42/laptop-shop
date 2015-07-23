using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_OrderNo : System.Web.UI.Page
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
      binddata();
    }
  }

  private void binddata()
  {
    String type = Request.QueryString["lei"];
    String sql = "select o.ID,Name,Email,MobilePhone,DateTimed,HasCheck from Orders o,Customers c where c.ID=o.CustomerID and ";
    if (type == "yes")
    {
      sql += "hascheck='1'";
      LabCheck.Text = "已处理订单";
    }
    else if (type == "no")
    {
      sql += "hascheck='0'";
      LabCheck.Text = "未处理订单";
    }
    else
    {
      String today = DateTime.Now.Date.ToString("MM/dd/yyyy");
      sql += "DateTimed >= '" + today + "'";
      LabCheck.Text = "今天新增订单";
    }

    conn = new SqlConnection(StrConnection);
    conn.Open();
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Orders");

    GridView1.DataSource = ds.Tables["Orders"].DefaultView;
    GridView1.DataBind();
    conn.Close();
  }
  protected void BtnSearch_Click(object sender, EventArgs e)
  {
    String id = TBKeyword.Text;
    String type = DDLType.SelectedValue;
    String sql = "select o.ID,Name,Email,MobilePhone,DateTimed,HasCheck from Orders o,Customers c where c.ID=o.CustomerID and o.ID='"+id+"' and ";
    if (type == "yes")
    {
      sql += "hascheck='1'";
      LabCheck.Text = "已处理订单";
    }
    else if (type == "no")
    {
      sql += "hascheck='0'";
      LabCheck.Text = "未处理订单";
    }
    else if (type == "all")
    {
      sql += "c.ID=o.CustomerID";
      LabCheck.Text = "所有订单";
    }
    else
    {
      String today = DateTime.Now.Date.ToString("MM/dd/yyyy");
      sql += "DateTimed >= '" + today + "'";
      LabCheck.Text = "今天新增订单";
    }

    conn = new SqlConnection(StrConnection);
    conn.Open();
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Orders");

    GridView1.DataSource = ds.Tables["Orders"].DefaultView;
    GridView1.DataBind();
    conn.Close();
  }
}