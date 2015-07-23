<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <style type="text/css">
    .style4
    {
      width: 100%;
    }
  </style>
  <script type="text/javascript">
    function sayhi(obj) {
      var d = obj.nextSibling.nextSibling;
      var s = d.innerText + "&quantity=" + obj.value;
      window.location.replace(s);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div>
    我的购物车</div>
  <div class="carttitle">
    <div class="ct1">
      商品名称</div>
    <div class="ct2">
      单价</div>
    <div class="ct3">
      数量</div>
    <div class="ct4">
      小计</div>
  </div>
  <div>
    <asp:DataList ID="DataList1" runat="server">
      <ItemTemplate>
        <div class="cartitem">
          <%--<div class="cartckb">
            <asp:CheckBox ID="CheckBox1" runat="server" />
          </div>--%>
          <img src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
            border="0" width="100px" height="100px">
          <div class="cartmodel">
            <%# DataBinder.Eval(Container.DataItem, "ModelNumber") %>
            -
            <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
          </div>
          <div class="cartcost">
            <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
          </div>
          <div class="cartquantity">
            <a href="AddToCart.aspx?Type=minus&ProductId=<%# DataBinder.Eval(Container.DataItem, "ProductId") %>">
              -</a>
            <%--<asp:TextBox CssClass="carttb" ID="TextBox1" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' onkeydown="sayhi(this)" AutoPostBack="false" ></asp:TextBox>--%>
            <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="carttb" id="TextBox1" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' onblur="sayhi(this)" />
            <div style="display:none">AddToCart.aspx?Type=set&ProductId=<%# DataBinder.Eval(Container.DataItem, "ProductId") %></div>
            <a href="AddToCart.aspx?Type=plus&ProductId=<%# DataBinder.Eval(Container.DataItem, "ProductId") %>">
              +</a>
          </div>
          <div class="cartcost">
            <%# DataBinder.Eval(Container.DataItem, "subtotal", "{0:c}") %>
          </div>
          <div class="cartaction">
            <a href="AddToCart.aspx?Type=delete&ProductId=<%# DataBinder.Eval(Container.DataItem, "ProductId") %>">
              删除</a></div>
        </div>
      </ItemTemplate>
    </asp:DataList>
    <div class="cartallcost">
      <%--      <div class="cartselectall">
        <asp:CheckBox ID="CheckBox2" runat="server" />全选
        <a href="#" class="cartdelall">删除所有选中项</a>
      </div>--%>
      <div class="cartcount">
        <p class="cartprecost" id="cart-count">
          总计：￥<asp:Label ID="PreCount" runat="server" Text="￥xxx.xx"></asp:Label></p>
        <div class="cartdone">
          <a href="CheckOut.aspx">去结算</a></div>
      </div>
    </div>
  </div>
</asp:Content>
