using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
  String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
  SqlConnection conn;
  SqlCommand cmd;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      FlashNews();
      FlashCommend();
      FlashHotClick();
      FlashHotSales();
      FlashNew();
    }
  }

  public string SubStr(string sString, int nLeng)
  {
    if (sString.Length <= nLeng)
    {
      return sString;
    }
    string sNewStr = sString.Substring(0, nLeng);
    sNewStr = sNewStr + "...";
    return sNewStr;
  }
  private void FlashNews()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select * from News order by datetimed desc";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "News");

    GridView1.DataSource = ds.Tables["News"].DefaultView;
    GridView1.DataBind();
    /****/
    for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
    {
      DataRowView mydrv;
      string gIntro,id;
      if (GridView1.PageIndex == 0)
      {
        mydrv = ds.Tables["News"].DefaultView[i];//表名
        gIntro = Convert.ToString(mydrv["Name"]);//所要处理的字段
        id = Convert.ToString(mydrv["ID"]);
        GridView1.Rows[i].Cells[0].Text = "<a href='News.aspx?ID="+id+"'>" + SubStr(gIntro, 10) + "</a>";
        gIntro = Convert.ToString(mydrv["Memo"]);
        GridView1.Rows[i].Cells[1].Text = SubStr(gIntro, 27);
      }
      else
      {
        mydrv = ds.Tables["News"].DefaultView[i + (5 * GridView1.PageIndex)];
        gIntro = Convert.ToString(mydrv["Name"]);
        id = Convert.ToString(mydrv["ID"]);
        GridView1.Rows[i].Cells[0].Text = "<a href='News.aspx?ID=" + id + "'>" + SubStr(gIntro, 10) + "</a>";
        gIntro = Convert.ToString(mydrv["Memo"]);
        GridView1.Rows[i].Cells[1].Text = SubStr(gIntro, 27);
      }
      //GridView1.Rows[i].Cells[1].Style.Add("white-space", "nowrap");
    }
    conn.Close();
  }
  private void FlashHotClick()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select top 6 * from Products order by clicks desc";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Products");

    GridView2.DataSource = ds.Tables["Products"].DefaultView;
    GridView2.DataBind();
    conn.Close();
  }
  private void FlashHotSales()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select top 6 * from Products order by sales desc";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Products");

    GridView3.DataSource = ds.Tables["Products"].DefaultView;
    GridView3.DataBind();
    conn.Close();
  }

  protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
  {

  }
  // 翻页
  protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    GridView1.PageIndex = e.NewPageIndex;
    FlashNews();
  }

  private void FlashCommend()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select top 8 * from Products where Commend='1'";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Products");

    DataList1.DataSource = ds.Tables["Products"].DefaultView;
    DataList1.DataBind();
    conn.Close();
  }
  private void FlashNew()
  {
    conn = new SqlConnection(StrConnection);
    conn.Open();
    String sql = "select top 3 * from Products order by datetimed desc";
    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    DataSet ds = new DataSet();
    myda.Fill(ds, "Products");

    DataList2.DataSource = ds.Tables["Products"].DefaultView;
    DataList2.DataBind();
    conn.Close();
  }

  /*******************************/
  protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f5f5f5'; this.style.fontWeight='bold';");
      e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor; this.style.fontWeight='';");
    }

    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      e.Row.Attributes.Add("onclick", "this.style.backgroundColor='#f5f5f5'; this.style.cursor='hand';");
    }
  }
  protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
  {

  }
}
