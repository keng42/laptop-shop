using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SearchProducts : System.Web.UI.Page
{
    String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
    SqlConnection conn;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String keyword = Request.QueryString["Keyword"];
            binddata(keyword);
        }
    }

    private void binddata(String keyword)
    {
        conn = new SqlConnection(StrConnection);
        conn.Open();
        String sql = "select * from Products where (modelname like '%" +
            keyword + "%' or modelnumber like '%" + keyword + "%')";
        SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        myda.Fill(ds, "Products");

        DataList1.DataSource = ds.Tables["Products"].DefaultView;
        DataList1.DataBind();
        conn.Close();
    }

    protected void SearchInDB(object sender, EventArgs e)
    {
        String keyword = txtkeyword.Value;
        binddata(keyword);
    }

    // 刷新数据
    //private void binddata()
    //{
    //    String str;
    //    if (txtkeyword.Value == "")
    //        str = (String)Session["key"];
    //    else
    //        str = txtkeyword.Value;


    //    conn = new SqlConnection(StrConnection);
    //    conn.Open();
    //    String sql = "select * from Products where (modelname like '%" + str + "%' or modelnumber like '%" + str + "%')";
    //    SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
    //    DataSet ds = new DataSet();
    //    myda.Fill(ds, "Products");

    //    GVSearchResult.DataSource = ds.Tables["Products"].DefaultView;
    //    GVSearchResult.DataBind();
    //    conn.Close();
    //}
}
