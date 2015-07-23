using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_adminAddProduct : System.Web.UI.Page
{
    String StrConnection = " Server=(local); Database=B2CSystem; User ID=sa;Password=root;";
    SqlConnection conn;
    SqlCommand cmd;
    //String imgname;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.Cookies["admin"] == null || Request.Cookies["admin"]["name"] == "")
        Response.Redirect("adminLogin.aspx");
        binddata();
    }

    public void binddata()
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
            bool bo = (select_menu.Items.FindByText(cate) == null);
            if (bo)
                select_menu.Items.Add(cate);
        }
        conn.Close();
    }

    protected void AddBtnClick(object sender, EventArgs e)
    {
        //Server.Transfer("addProductResult.aspx", true);
        String cate = select_menu.SelectedValue;
        String name, detail, code, img, price, vipprice;
        String date = DateTime.Now.ToString("yyyy-MM-dd HH:ss:mm");

        name = text_name.Value;
        detail = textarea_detail.Value;
        code = text_code.Value;
        img = text_img.Value;
        price = text_price.Value;
        vipprice = text_vipprice.Value;

        conn = new SqlConnection(StrConnection);
        conn.Open();
        String sql = "insert into Products Values ((select ID from Categories where Name='" + cate
            + "'),'" + code + "','" + name + "','" + Session["imgname"] + "','" + price + "','" +
            vipprice + "','" + detail + "','" + date + "','0','0','0','0','')";
        Session["imgname"] = "";

        cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();


        text_name.Value = "";
        textarea_detail.Value = "";
        text_code.Value = "";
        text_img.Value = "";
        text_price.Value = "";
        text_vipprice.Value = "";
        select_menu.SelectedIndex = -1;
        Img.Text = "";
    }
    protected void uploadImg(object sender, EventArgs e)
    {
        string FileName;
        int FileSize;
        string Filepath;
        Boolean fileOK = false;
        String[] allowedExtensions = { ".gif", ".jpg", ".png" };
        String fileExtension = System.IO.Path.GetExtension(File1.FileName).ToLower();
        FileName = this.File1.FileName.ToString();
        FileSize = this.File1.PostedFile.ContentLength;
        if (File1.HasFile)
        {
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i] && FileSize <= 1024000)
                {
                    fileOK = true;
                    break;
                }
            }
            if (fileOK)
            {
                try
                {
                    Session["imgname"] = DateTime.Now.ToString("yyyyMMddHHmmss") + fileExtension;
                    Filepath = Server.MapPath("") + "/../ProductImages/" + Session["imgname"];
                    File1.SaveAs(Filepath);
                    Img.Text = "<img id=\"img_car\" alt=\"car\" src=\"../ProductImages/" + Session["imgname"] +
                        "\" Width=\"100px\" Height=\"100px\" />";
                    text_img.Value = Img.Text;
                }
                catch (Exception ex)
                {
                    Img.Text = ex.Message;
                }
            }
            else
            {
                Img.Text = "图片类型仅支持：jpg png gif<br>图片大小不大于 1MB";
            }
        }

    }
}
