<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="Product.aspx.cs" Inherits="Product" %>

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
  <div class="title">
    商品明细查看</div>
  <asp:DataList ID="DataList1" runat="server" RepeatColumns="1">
    <ItemTemplate>
      <table class="style4">
        <tr>
          <td  class="detail2">
            <img alt="" src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
              border="0">
            <br>
            <div>
              商品价格：<font color="silver"><del>
                <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
              </del></font>
            </div>
            <div>
              优惠价格：<font color="coral">
                <%# DataBinder.Eval(Container.DataItem, "Discount", "{0:c}")%>
              </font>
            </div>
            <div>
              点击数：
              <%# DataBinder.Eval(Container.DataItem, "Clicks", "{0}")%>
            </div>
            <div>
              销 量：
              <%# DataBinder.Eval(Container.DataItem, "Sales", "{0}")%>
            </div>
            <%--<asp:LinkButton ID="LBGetThis" runat="server">订购此商品</asp:LinkButton>--%>
            <a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'>订购此商品</a>
          </td>
          <td class="detail">
            <div>
              【<font color="coral">商品编号</font>】<%# DataBinder.Eval(Container.DataItem, "ModelNumber") %></div>
            <div>
              【<font color="coral">商品名称</font>】<%# DataBinder.Eval(Container.DataItem, "ModelName") %></div>
            <div>
              【<font color="coral">商品品牌</font>】<%# DataBinder.Eval(Container.DataItem, "Name") %></div>
            <hr />
            <div>
              【<font color="coral">商品描述</font>】<%# DataBinder.Eval(Container.DataItem, "Description") %></div>
          </td>
        </tr>
      </table>
    </ItemTemplate>
  </asp:DataList>
</asp:Content>
