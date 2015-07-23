using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      //if (Session["login"] == null)
      //{
      //}
      //else if ((Boolean)Session["login"])
      //{
      //  Server.Transfer("Default.aspx");
      //}
      if (Request.Cookies["login"] != null && Request.Cookies["login"]["username"] != "")
      {
        Response.Redirect("Member.aspx");
      }
    }

  }
  protected void BtnLoginClick(object sender, EventArgs e)
  {
    //Server.Transfer("LoginResult.aspx");
    String email = text_email.Value;
    String pass = pwd.Value;
    String sql = "select * from Customers where Email='" + email + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      reader.Read();
      String userid = reader.GetValue(0).ToString();
      String username = reader.GetValue(1).ToString();
      String password = reader.GetValue(3).ToString();
      if (password.Equals(pass))
      {
        //Session["login"] = true;
        //Session["user"] = username;
        //Server.Transfer("Default.aspx");
        Response.Cookies["login"]["username"] = username;
        Response.Cookies["login"]["email"] = email;
        Response.Cookies["login"]["userid"] = userid;
        if (AutoLogin.Checked)
        {
          Response.Cookies["login"].Expires = DateTime.Now.AddDays(30d);
        }
        // 合并购物车，并删除临时购物车
        String fuck = Request.Cookies["login"]["userid"];
        UpdateCart(userid);
        String fuck2 = Request.Cookies["login"]["userid"];
        Response.Redirect("Member.aspx");
      }
      else
        Response.Write("用户名或密码错误");
    }
    else
    {
      Response.Write("该邮箱未注册");
    }
    conn.Close();

  }

  private void UpdateCart(String cartid)
  {
    if (Request.Cookies["ShoppingCartID"] == null)
    {
      return;
    }
    String tempcartid;
    //cartid = Request.Cookies["login"]["userid"];
    tempcartid = Request.Cookies["ShoppingCartID"].Value;

    // 获取临时购物车里的所有item
    String allsql = "";
    String sql = "select * from ShoppingCart where CartID='" + tempcartid + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();

    IList pids = new ArrayList();
    IList qans = new ArrayList();
    if (reader.HasRows)
    {
      while (reader.Read())
      {
        pids.Add(reader.GetValue(2).ToString());
        qans.Add(reader.GetValue(3).ToString());
      }
    }
    else
    {
      // do nothing, maybe sth wrong
      return;
    }
    reader.Close();
    sql = "select * from ShoppingCart where CartID='" + cartid + "'";
    cmd = new SqlCommand(sql, conn);
    reader = cmd.ExecuteReader();
    IList oripids = new ArrayList();
    if (reader.HasRows)
    {
      while (reader.Read())
      {
        oripids.Add(reader.GetValue(2).ToString());
      }
    }
    else
    {
      // do nothing, maybe sth wrong
    }
    reader.Close();

    // 合并购物车
    String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    for (int i = 0; i < pids.Count; i++)
    {
      String pid = pids[i].ToString();
      if (oripids.Contains(pid))
      {
        allsql += "update ShoppingCart set Quantity=Quantity+'" + qans[i].ToString() + "', Datetimed='" + date + "' where CartID='" + cartid + "' and ProductID='" + pid + "';";
      }
      else
      {
        allsql += "update ShoppingCart set CartID='" + cartid + "' where CartID='" + tempcartid + "'and ProductID='" + pid + "';";
      }
    }
    // 更新数据库
    allsql += "delete from ShoppingCart where CartID='" + tempcartid + "';";
    //reader.Close();
    cmd = new SqlCommand(allsql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();
  }
  protected void Button1_Click(object sender, EventArgs e)
  {
    Server.Transfer("Register.aspx");
  }
}
