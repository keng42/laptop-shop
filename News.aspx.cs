using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class News : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    String id = Request.QueryString["ID"];
    String sql = "select Name,Memo,DateTimed from News where ID='" + id + "'";
    conn = new SqlConnection(StrConnection);
    conn.Open();
    cmd = new SqlCommand(sql, conn);
    SqlDataReader reader = cmd.ExecuteReader();
    reader.Read();
    String name, memo, time;
    name = reader.GetValue(0).ToString();
    memo = reader.GetValue(1).ToString();
    time = reader.GetValue(2).ToString();
    NewsName.Text = name;
    NewsMemo.Text = memo;
    NewsTime.Text = "发布时间：" + time;
    conn.Close();
  }
}