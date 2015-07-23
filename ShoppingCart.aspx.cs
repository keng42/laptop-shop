using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ShoppingCart : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      FlashCart();
    }
  }



  private void FlashCart()
  {
    String cartid;
    if (Request.Cookies["login"] != null && Request.Cookies["login"]["username"] != "")
    {
      cartid = Request.Cookies["login"]["userid"];
    }
    else if (Request.Cookies["ShoppingCartID"] != null)
    {
      cartid = Request.Cookies["ShoppingCartID"].Value;
    }
    else
    {
      return;
    }

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
    PreCount.Text = count.ToString() ;

    conn.Close();
  }
  protected void MinusOne(object sender, EventArgs e)
  {
    Response.Write("MinusOne");
  }
  protected void PlusOne(object sender, EventArgs e)
  {
    Response.Write("PlusOne");
  }
}