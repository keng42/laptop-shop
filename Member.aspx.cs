using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Member : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {

    if (!IsPostBack)
    {
      if (Request.Cookies["login"] == null || Request.Cookies["login"]["username"] == "")
      {
        Response.Redirect("login.aspx");
      }
	  FlashUserInfo();
      FlashOrderTable(); 
    }
  }
  
  protected void FlashUserInfo(){
	  String email = Request.Cookies["login"]["email"];
	  
	  //Response.Write(email);
	  
      String sql = "select * from Customers where Email='" + email + "'";
      conn = new SqlConnection(StrConnection);
      conn.Open();
      cmd = new SqlCommand(sql, conn);
      SqlDataReader reader = cmd.ExecuteReader();
      reader.Read();
      String nick = reader.GetValue(1).ToString();
      String phone = reader.GetValue(4).ToString();
      String mobile = reader.GetValue(5).ToString();
      String addr = reader.GetValue(7).ToString();
      String code = reader.GetValue(6).ToString();

      p_code.Text = code;
      p_address.Text = addr;
      p_email.InnerText = email;
      p_mobile.Text = mobile;
      p_phone.Text = phone;
      p_nick.Text = nick;
      conn.Close();
  }
  
  
  protected void savechange(object sender, EventArgs e)
  {
    String code = p_code.Text;
    String addr = p_address.Text;
    String email = p_email.InnerText;
    String mobile = p_mobile.Text;
    String phone = p_phone.Text;
    String nick = p_nick.Text;
    String pwd = p_pwd.Text;

    //String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
    //SqlConnection conn;
    //SqlCommand cmd;
    //String email = Request.Cookies["login"]["email"];
    String sql;
    if (pwd.Equals("******"))
    {
      sql = "update Customers set Name='" + nick + "',Phone='" + phone + "',MobilePhone='" + mobile + "',Postcode='" + code + "',Address='" + addr + "' where email='" + email + "';";
    }
    else
    {
      sql = "update Customers set Name='" + nick + "',Phone='" + phone + "',MobilePhone='" + mobile + "',Postcode='" + code + "',Address='" + addr + "',Password='" + pwd + "' where email='" + email + "';";
    }
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
    String userid=Request.Cookies["login"]["userid"];
    Response.Cookies["login"]["username"] = nick;
    Response.Cookies["login"]["email"] = email;
    Response.Cookies["login"]["userid"] = userid;
    Server.Transfer("Member.aspx");
  }

  protected void logout(object sender, EventArgs e)
  {
    //Session["login"] = false;
    //Session["user"] = "";
    Response.Cookies["login"]["username"] = "";
    Response.Cookies["login"]["email"] = "";
    Response.Cookies["login"].Expires = DateTime.MinValue;
    Response.Redirect("Default.aspx");
  }

  protected void FlashOrderTable()
  {
    String userid = Request.Cookies["login"]["userid"];
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select o.ID,HasCheck,Quantity,od.Unitcost,ModelName,ModelNumber,Quantity*od.Unitcost as Subtotal from Orders o,OrderDetails od,Products p where od.OrderID=o.ID and p.ProductID=od.ProductID and o.CustomerID='" + userid + "'";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "hiu");

    GridView1.DataSource = ds.Tables["hiu"].DefaultView;
    GridView1.DataBind();

    conn.Close();
  }

   protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      String hc = DataBinder.Eval(e.Row.DataItem, "HasCheck").ToString();
      if (hc == "False")
      {
        e.Row.Cells[6].Text = "未处理";
      }
      else
        e.Row.Cells[6].Text = "已处理";
    }
  }
}
