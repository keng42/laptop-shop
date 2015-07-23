using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ProductsTop : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      ViewState["pageindex"] = 0;
      dlbinddata();

    }
  }

  public void dlbinddata()
  {
    String type = Request.QueryString["Type"];

    PagedDataSource ps = new PagedDataSource();
    conn = new SqlConnection(StrConnection);
    conn.Open();
    string sql;
    if (type.Equals("CategoryId"))
      sql = "select * from Products where categoryid='" + Request.QueryString["CateId"] + "'";
    else
      sql = "select * from Products order by " + type + " desc";



    SqlDataAdapter MyAdapter = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    MyAdapter.Fill(ds, "Products");

    ViewState["PageCount"] = ps.PageCount;
    ps.DataSource = ds.Tables["Products"].DefaultView;
    ps.AllowPaging = true;
    ps.PageSize = 10;
    ps.CurrentPageIndex = int.Parse(ViewState["pageindex"].ToString());

    if (ps.CurrentPageIndex == 0)
      LBPre.Visible = false;
    else
      LBPre.Visible = true;
    if (ps.CurrentPageIndex == ps.PageCount - 1)
      LBNext.Visible = false;
    else
      LBNext.Visible = true;

    DataList1.DataSource = ps;
    DataList1.DataBind();
    conn.Close();
  }




  protected void IndexChanging(object sender, EventArgs e)
  {
    string strCommand = ((LinkButton)sender).CommandArgument.ToString();
    int pageindex = int.Parse(ViewState["pageindex"].ToString());
    if (strCommand == "pre")
    {
      //if(pageindex != 0)
      pageindex = pageindex - 1;
    }
    else
    {
      //if (pageindex < int.Parse(ViewState["pageindex"].ToString()))
      pageindex = pageindex + 1;
    }
    ViewState["pageindex"] = pageindex;
    dlbinddata();
  }

  //protected void BtnSearch_Click(object sender, EventArgs e)
  //{

  //}
}