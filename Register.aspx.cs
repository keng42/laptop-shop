using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {

  }
  protected void RegisterBtnClick(object sender, EventArgs e)
  {
    String email = text_email.Value;
    String password = text_loginpwd.Value;
    String nick = text_nick.Value;
    String phone = text_phone.Value;
    String mobilephone = text_mobile.Value;
    String address = text_address.Value;
    String postcode = text_code.Value;

    String checksql = "select * from Customers where email='" + email + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(checksql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
      Response.Write("该邮箱已注册");
      conn.Close();
      return;
    }
    reader.Close();

    String sql = "insert into Customers Values('" + nick + "','" + email + "','" + password + "','" + phone + "','" + mobilephone + "','" + postcode + "','" + address +"','"+ DateTime.Now + "',0,0,0);";
    SqlCommand command = new SqlCommand(sql, conn);
    command.ExecuteNonQuery();
    conn.Close();
    Server.Transfer("Login.aspx");
  }
}
