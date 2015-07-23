using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Product : System.Web.UI.Page
{
    String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
    SqlConnection conn;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FlashDetail();
    }

    private void FlashDetail()
    {
        conn = new SqlConnection(StrConnection);
        conn.Open();
        String id = Request.QueryString["ProductId"];
        String sql = "select * from Categories,Products where Products.ProductID='"+id+
            "' and Categories.ID=(select CategoryID from Products where productid='"+id+"');"+
            "update Products set Clicks=Clicks+1 where ProductID='"+id+"';";
        //"select * from Products where productid='"+Request.QueryString["ProductId"]+"'";
        SqlDataAdapter myda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        myda.Fill(ds, "Products");

        DataList1.DataSource = ds.Tables["Products"].DefaultView;
        DataList1.DataBind();
        conn.Close();
    }
}