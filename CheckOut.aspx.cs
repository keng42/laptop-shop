using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CheckOut : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      CheckIfLogin();
      FlashOrder();
    }
  }

  private void FlashOrder()
  {
    String cartid = Request.Cookies["login"]["userid"];
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select ModelName,modelnumber,unitcost,productimage,quantity,s.productid,UnitCost*Quantity as subtotal from Products p,ShoppingCart s where CartID='" + cartid + "' and p.ProductID=s.ProductID;";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "hiu");

    DataList1.DataSource = ds.Tables["hiu"].DefaultView;
    DataList1.DataBind();

    // 计算总价格 2*4
    int unitcost, quantity, count;
    count = 0;
    for (int i = 0; i < ds.Tables["hiu"].Rows.Count; i++)
    {
      unitcost = Convert.ToInt32(ds.Tables["hiu"].Rows[i][2]);
      quantity = Convert.ToInt32(ds.Tables["hiu"].Rows[i][4]);
      count += unitcost * quantity;
    }
    PreCount.Text = count.ToString();

    conn.Close();
  }

  protected void CheckIfLogin()
  {
    if (Request.Cookies["login"] == null || Request.Cookies["login"]["username"] == "")
    {// 未登陆
      Response.Write("<script language=javascript>alert('请先登录')</script>");
      Server.Transfer("Login.aspx");
    }
  }

  // 付款操作
  protected void GoPay(object sender, EventArgs e)
  {
    String memo, userid, date, orderid;
    memo = TAMemo.Value;
    userid = Request.Cookies["login"]["userid"];
    date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

    // 先插入 order 然后获取 orderid
    String sql = "insert into Orders values('" + memo + "',0,'" + date + "','" + userid + "',null,0,0,0,0);select * from Orders where customerid='" + userid + "' and Datetimed='" + date + "';";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    reader.Read();
    orderid = reader.GetValue(0).ToString();
    reader.Close();
    conn.Close();

    // 插入购物车的item
    sql = "select s.productid,quantity,unitcost from Products p,ShoppingCart s where CartID='" + userid + "' and p.ProductID=s.ProductID;";
    String allsql = "";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    reader = cmd.ExecuteReader();

    while (reader.Read())
    {
      // 包括更新 Product 表
      allsql += "insert into OrderDetails values('" + orderid + "','" + reader.GetValue(0).ToString() + "','" + reader.GetValue(1).ToString() + "','" + reader.GetValue(2).ToString() + "');" +
        "update Products set Sales=Sales+'" + reader.GetValue(1).ToString() + "' where ProductID='" + userid + "';";
    }
    reader.Close();
    conn.Close();

    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(allsql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();

    BtnGoPay.Visible = false;
    Paied.Text = "已付款";
    LabOrderID.Text = "订单号为：" + orderid.ToString();
   
    // 清空购物车
    sql = "delete from ShoppingCart where CartID='" + userid + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
  }

 
}