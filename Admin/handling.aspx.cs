using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_handling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
        Response.Redirect("adminLogin.aspx");
    }
}
