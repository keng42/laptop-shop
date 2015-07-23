<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="ProductsTop.aspx.cs" Inherits="ProductsTop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link rel="stylesheet" type="text/css" href="CSS/FrontPage.css" />
  <style type="text/css">
    .style4
    {
      width: 100%;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div>
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
      CssClass="top-card">
      <ItemTemplate>
        <table class="style4">
          <tr>
            <td valign="top" align="middle" class="card testfive">
              <a target="view_window" href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                title="点击查看明细">
                <img src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                  border="0" width="100%" height="60%">
                <br>
                <div class="card-bottom">
                  <%# DataBinder.Eval(Container.DataItem, "ModelNumber") %>
                  -
                  <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
                  <br>
                  <font color="silver"><del>
                    <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
                  </del></font>
                  <br>
                  <font color="coral">
                    <%# DataBinder.Eval(Container.DataItem, "Discount", "{0:c}") %>
                  </font>
              </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
              </div> <a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                <img alt="" src="ProductImages/ShoppingCart.gif" border="0" title="点击订单此商品"></a>
            </td>
          </tr>
        </table>
      </ItemTemplate>
    </asp:DataList>
    
    <asp:LinkButton ID="LBNext" runat="server" OnCommand="IndexChanging" CommandArgument="next" CssClass="more prenext">下一页</asp:LinkButton>
    <asp:LinkButton ID="LBPre" runat="server" OnCommand="IndexChanging" CommandArgument="pre" CssClass="more prenext">上一页</asp:LinkButton>
  </div>
</asp:Content>
