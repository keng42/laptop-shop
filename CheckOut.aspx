<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div>
    <div>
      订单确认</div>
    <div class="carttitle">
      <div class="ct5">
        商品名称</div>
      <div class="ct6">
        单价</div>
      <div class="ct7">
        数量</div>
      <div class="ct8">
        小计</div>
    </div>
    <asp:DataList ID="DataList1" runat="server">
      <ItemTemplate>
        <div class="cartitem">
          <div class="cartckb">
          </div>
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
            <%# DataBinder.Eval(Container.DataItem, "Quantity") %>
          </div>
          <div class="cartaction">
            <%# DataBinder.Eval(Container.DataItem, "subtotal", "{0:c}")%></div>
        </div>
      </ItemTemplate>
    </asp:DataList>
    <div class="cartmemo">
      备注说明：<textarea runat="server" id="TAMemo" class="tamemo" rows="4" cols="100"></textarea>
    </div>
    <div class="cartallcost">
      <div class="cartcount">
        <p class="cartprecost" id="cart-count">
          总计：￥<asp:Label ID="PreCount" runat="server" Text="0"></asp:Label></p>
        <div class="cartdone">
          <a runat="server" onserverclick="GoPay" id="BtnGoPay">去付款</a>
          <asp:Label ID="Paied" runat="server" Text=""></asp:Label>
        </div>
        <asp:Label ID="LabOrderID" runat="server" Text="">
        </asp:Label>
      </div>
    </div>
  </div>
</asp:Content>
