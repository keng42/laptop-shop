<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="SearchProducts.aspx.cs" Inherits="SearchProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link rel="stylesheet" type="text/css" href="CSS/FrontPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" 
      RepeatDirection="Horizontal">
      <ItemTemplate>
        <table>
          <tr>
            <td valign="top" align="middle" class="card testfive">
              <a target="view_window" href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                title="点击查看明细">
                <img src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                  border="0" width="100%" height="60%">
                <br>
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
                </font></a>&nbsp;&nbsp;<br>
              <a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                <img alt="" src="ProductImages/ShoppingCart.gif" border="0" title="点击订单此商品"></a>
            </td>
          </tr>
        </table>
      </ItemTemplate>
    </asp:DataList>
  </div>
</asp:Content>
