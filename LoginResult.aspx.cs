using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String email = Request.Form["text_email"];
        String pwd = Request.Form["pwd"];

        Response.Write("电子邮件： " + email);
        Response.Write("<br>密码： " + pwd);
    }
}
