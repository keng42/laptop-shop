using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_adminmain : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
      Response.Redirect("adminLogin.aspx");
  }
  protected void toindex(object sender, EventArgs e)
  {
    Server.Transfer("adminindex.aspx");
  }
  protected void handling(object sender, EventArgs e)
  {
    Server.Transfer("handling.aspx");
  }
  protected void adminAddClass(object sender, EventArgs e)
  {
    Server.Transfer("adminAddClass.aspx");
  }
  protected void adminAddProduct(object sender, EventArgs e)
  {
    Server.Transfer("adminAddProduct.aspx");
  }
  protected void adminAddNews(object sender, EventArgs e)
  {
    Server.Transfer("adminAddNews.aspx");
  }
  protected void products(object sender, EventArgs e)
  {
    Server.Transfer("Products.aspx");
  }
  protected void changePwd(object sender, EventArgs e)
  {
    Server.Transfer("adminChangePwd.aspx");
  }
  protected void logout(object sender, EventArgs e)
  {
    Response.Cookies["admin"]["name"] = "";
    //Response.Cookies["admin"].Expires = DateTime.MinValue;
    //Response.Redirect("adminLogin.aspx");
  }
  protected void toorderno(object sender, EventArgs e)
  {
    Server.Transfer("OrderNo.aspx?lei=no");
  }
  protected void toorderyes(object sender, EventArgs e)
  {
    Server.Transfer("OrderNo.aspx?lei=yes");
  }
  protected void toordertoday(object sender, EventArgs e)
  {
    Server.Transfer("OrderNo.aspx?lei=now");
  }
}
