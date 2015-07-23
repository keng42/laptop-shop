using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_adminAddClass : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
      Response.Redirect("adminLogin.aspx");
    binddata();
  }

  protected void binddata()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select Name from Categories";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Categories");

    for (int i = 0; i < ds.Tables["Categories"].Rows.Count; i++)
    {
      string cate = ds.Tables["Categories"].Rows[i][0].ToString();
      bool bo = (ListBox1.Items.FindByText(cate) == null);
      if (bo)
        ListBox1.Items.Add(cate);
    }
    conn.Close();
  }

  protected void Btn_del_Click(object sender, EventArgs e)
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "delete from Products where CategoryID=(select id from Categories where name='"
        + this.ListBox1.SelectedItem.Text + "');"
        + "delete from Categories where Name='" + this.ListBox1.SelectedItem.Text + "';";
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();

    this.ListBox1.Items.Remove(this.ListBox1.SelectedItem);
  }

  protected void Btn_add_Click(object sender, EventArgs e)
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String name = text_add.Text;
    String sql = "insert into Categories values('" + name + "','" + name + name + "')";
    cmd = new SqlCommand(sql, conn);
    cmd.ExecuteNonQuery();
    conn.Close();

    ListItem objItem = new ListItem(text_add.Text, text_add.Text);
    this.ListBox1.Items.Add(objItem);
    text_add.Text = "";
  }


}
