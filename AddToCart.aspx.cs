using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddToCart : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Request.QueryString["Type"] == null)
        UpdateCart();
      else if (Request.QueryString["Type"] == "minus")
        MinusOne();
      else if (Request.QueryString["Type"] == "plus")
      {
        UpdateCart();
        Server.Transfer("ShoppingCart.aspx");
      }
      else if (Request.QueryString["Type"] == "set")
      {
        SetCart();
        Server.Transfer("ShoppingCart.aspx");
      }
      else
        DeleteAll();
    }
  }

  private void DeleteAll()
  {
    //判定当前用户，得到 CartID
    String cartid = GetShoppingCartID();
    //判定当前用户是否已加入该商品
    String productid = Request.QueryString["ProductId"];
    String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    String sql = "delete from ShoppingCart where CartID='" + cartid + "' and ProductID='" + productid + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
    Server.Transfer("ShoppingCart.aspx");
  }

  private void MinusOne()
  {
    //判定当前用户，得到 CartID
    String cartid = GetShoppingCartID();
    String productid = Request.QueryString["ProductId"];
    // 判定数量是否为 1
    String sql = "select * from ShoppingCart where CartID='" + cartid + "' and ProductID='" + productid + "' and Quantity=1";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      reader.Close();
      DeleteAll();
    }
    else
    {
      reader.Close();
      String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
      sql = "update shoppingCart set Quantity=Quantity-1 , DateTimed='" + date + "' where CartID='" + cartid + "' and ProductID='" + productid + "'";
      cmd = new SqlCommand(sql, conn);
      cmd.ExecuteNonQuery();
      conn.Close();
      Server.Transfer("ShoppingCart.aspx");
    }
  }

  private void UpdateCart()
  {
    //判定当前用户，得到 CartID
    String cartid = GetShoppingCartID();
    String productid = Request.QueryString["ProductId"];
    String sql = "select * from ShoppingCart where CartID='" + cartid + "' and ProductID='" + productid + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    if (reader.HasRows)
    {
      //reader.Read();
      sql = "update shoppingCart set Quantity=Quantity+1 , DateTimed='" + date + "' where CartID='" + cartid + "' and ProductID='" + productid + "'";
    }
    else
    {
      sql = "insert into ShoppingCart values('" + cartid + "','" + productid + "',1,'" + date + "')";
    }
    // 更新数据库
    reader.Close();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
  }

  private void SetCart()
  {
    String quantity = Request.QueryString["quantity"];
    int q = int.Parse(quantity);
    


    //判定当前用户，得到 CartID
    String cartid = GetShoppingCartID();
    String productid = Request.QueryString["ProductId"];
    String sql = "select * from ShoppingCart where CartID='" + cartid + "' and ProductID='" + productid + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    if (reader.HasRows)
    {
      //reader.Read();
      if (q <= 0)
      {
        sql = "delete from shoppingCart where CartID='" + cartid + "' and ProductID='" + productid + "'";
      }
      else
        sql = "update shoppingCart set Quantity='" + quantity + "' , DateTimed='" + date + "' where CartID='" + cartid + "' and ProductID='" + productid + "'";
    }
    else
    {
      sql = "insert into ShoppingCart values('" + cartid + "','" + productid + "',1,'" + date + "')";
    }
    // 更新数据库
    reader.Close();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
  }

  public String GetShoppingCartID()
  {
    //已登录用户以CustomerID作为CartID，具体代码略。
    if (Request.Cookies["login"] == null || Request.Cookies["login"]["userid"] == "")
    {
    }
    else
    {
      return Context.Request.Cookies["login"]["userid"];
    }
    //未登录用户查看cookies所保存的历史信息
    if (Context.Request.Cookies["ShoppingCartID"] != null)
    {
      return Context.Request.Cookies["ShoppingCartID"].Value;
    }
    //利用Guid生成全局统一标识符作为CartID并保存在cookies中
    else
    {
      Guid TempCartId = Guid.NewGuid();
      Context.Response.Cookies["ShoppingCartID"].Value = TempCartId.ToString();
      return TempCartId.ToString();
    }
  }

}