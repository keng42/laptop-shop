using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_OrderInfo : System.Web.UI.Page
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
      FlashData();
    }
  }

  private void FlashData()
  {
    DivCartInfo.Visible = false;
    DivOrderInfo.Visible = false;
    DivUserInfo.Visible = false;

    if (Request.QueryString["type"] == null)
    {
      Response.Write("Something wrong...");
      return;
    }

    String type = Request.QueryString["type"];

    if (type == "user")
    {
      FlashUserInfo();
      DivUserInfo.Visible = true;
    }
    else if (type == "cart")
    {
      FlashCartData();
      FlashHasView();
      DivCartInfo.Visible = true;
    }
    else if (type == "check")
    {
      FlashHasCheck();
    }
    else
    {
      FlashOrderInfo();
      DivOrderInfo.Visible = true;
    }
  }

  private void FlashHasCheck()
  {
    String id = Request.QueryString["id"];
    String sql = "select * from Orders where ID='" + id + "' and HasView=1";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      reader.Close();
      cmd.Cancel();
      sql = "update Orders set HasCheck=1 where ID='" + id + "' and HasView=1";
      cmd = new SqlCommand(sql, conn);
      cmd.ExecuteNonQuery();
      conn.Close();
      LabTitle.Text = "成功处理该订单";
    }
    else
    {
      conn.Close();
      Response.Write("<script language=javascript>alert('当前订单未查看')</script>");
      Server.Transfer("OrderNo.aspx?lei=no");
      // not allow
    }
  }

  private void FlashHasView()
  {
    String id = Request.QueryString["id"];
    String sql = "update Orders set HasView=1 where ID='" + id + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
  }

  private void FlashCartData()
  {
    String id = Request.QueryString["id"];
    String sql = "select od.OrderID,od.ProductID,Quantity,od.UnitCost,ModelName+' - '+ModelNumber as model from OrderDetails od,Products p where p.ProductID=od.ProductID and od.OrderID='" + id + "'";

    conn = new SqlConnection(StrConnection);
    conn.Open();
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Orders");

    GVCartInfo.DataSource = ds.Tables["Orders"].DefaultView;
    GVCartInfo.DataBind();
    conn.Close();

    // 计算总价格 2*4
    int unitcost, quantity, count;
    count = 0;
    for (int i = 0; i < ds.Tables["Orders"].Rows.Count; i++)
    {
      unitcost = Convert.ToInt32(ds.Tables["Orders"].Rows[i][3]);
      quantity = Convert.ToInt32(ds.Tables["Orders"].Rows[i][2]);
      count += unitcost * quantity;
    }
    LabCost.Text = "此订单总金额：￥"+count.ToString();

    LabTitle.Text = "购物清单";
  }

  private void FlashUserInfo()
  {
    String id = Request.QueryString["id"];
    String sql = "select Name,Email,Password,Phone,MobilePhone,Postcode,Address from Customers c,Orders o where c.ID=o.CustomerID and o.ID='" + id + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      reader.Read();
      LabUserName.Text = reader.GetValue(0).ToString();
      LabEmail.Text = reader.GetValue(1).ToString();
      LabPWD.Text = reader.GetValue(2).ToString();
      LabTrueName.Text = reader.GetValue(0).ToString();
      LabPhone.Text = reader.GetValue(3).ToString();
      LabMobile.Text = reader.GetValue(4).ToString();
      LabPostCode.Text = reader.GetValue(5).ToString();
      LabAddress.Text = reader.GetValue(6).ToString();
    }
    conn.Close();
    LabTitle.Text = "此订单的送货详细资料";
  }

  private void FlashOrderInfo()
  {
    String id = Request.QueryString["id"];
    String sql = "select o.ID,c.Name,Email,Phone,Address,Postcode,DateTimed,Memo from Customers c,Orders o where c.ID=o.CustomerID and o.ID='" + id + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      reader.Read();
      LabOrderID.Text = reader.GetValue(0).ToString();
      LabContact.Text = reader.GetValue(1).ToString();
      LabOIEmail.Text = reader.GetValue(2).ToString();
      LabOIPhone.Text = reader.GetValue(3).ToString();
      LabOIAddress.Text = reader.GetValue(4).ToString();
      LabOIPostCode.Text = reader.GetValue(5).ToString();
      LabOrderDate.Text = reader.GetValue(6).ToString();
      LabMemo.Text = reader.GetValue(7).ToString();
    }
    conn.Close();
    LabTitle.Text = "用户注册资料";
  }
}