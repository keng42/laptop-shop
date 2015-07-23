<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderInfo.aspx.cs" Inherits="Admin_OrderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link type="text/css" rel="Stylesheet" href="../CSS/Products.css" />
  <title></title>
  <style type="text/css">
    .style1
    {
      width: 100%;
    }
    .style2
    {
      width: 130px;
    }
    .style3
    {
    }
    .style4
    {
    }
    .style5
    {
      width: 150px;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <div class="ontitle"><asp:Label ID="LabTitle" runat="server" Text="购物清单"></asp:Label></div>
    <div runat="server" id="DivCartInfo">
      <asp:GridView ID="GVCartInfo" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%">
        <Columns>
          <asp:BoundField DataField="OrderID" HeaderText="所属订单号" />
          <asp:BoundField DataField="ProductID" HeaderText="商品编号" />
          <asp:BoundField DataField="model" HeaderText="商品名称" />
          <asp:BoundField DataField="UnitCost" HeaderText="单价" />
          <asp:BoundField DataField="Quantity" HeaderText="数量" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <%--<SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />--%>
      </asp:GridView>
      <div class="oicost"><asp:Label ID="LabCost" runat="server" Text=""></asp:Label></div>
    </div>
    <br />
    <div id="DivUserInfo" runat="server">
      <table class="style1" border="1px solid grey">
        <tr>
          <td class="style2">
            用户名：
          </td>
          <td class="style2">
            <asp:Label ID="LabUserName" runat="server" Text="username"></asp:Label>
          </td>
          <td class="style2">
            Email：
          </td>
          <td class="style3">
            <asp:Label ID="LabEmail" runat="server" Text="email"></asp:Label>
          </td>
          <td class="style2">
            密码：
          </td>
          <td>
            <asp:Label ID="LabPWD" runat="server" Text="******"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style2">
            姓名：
          </td>
          <td class="style2">
            <asp:Label ID="LabTrueName" runat="server" Text="truename"></asp:Label>
          </td>
          <td class="style2">
            电话：
          </td>
          <td class="style3">
            <asp:Label ID="LabPhone" runat="server" Text="12345678"></asp:Label>
          </td>
          <td class="style2">
            移动电话：
          </td>
          <td>
            <asp:Label ID="LabMobile" runat="server" Text="15012345678"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style2">
            邮政编码：
          </td>
          <td class="style2">
            <asp:Label ID="LabPostCode" runat="server" Text="510000"></asp:Label>
          </td>
          <td class="style2">
            地址：
          </td>
          <td class="style3" colspan="3">
            <asp:Label ID="LabAddress" runat="server" Text="address"></asp:Label>
          </td>
        </tr>
      </table>
    </div>
    <br />
    <div id="DivOrderInfo" runat="server">
      <table class="style1" border="1px solid grey">
        <tr>
          <td class="style5">
            订单号：
          </td>
          <td>
            <asp:Label ID="LabOrderID" runat="server" Text="1"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            联系人：
          </td>
          <td>
            <asp:Label ID="LabContact" runat="server" Text="sb."></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            Email：
          </td>
          <td>
            <asp:Label ID="LabOIEmail" runat="server" Text="email"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            电话：
          </td>
          <td>
            <asp:Label ID="LabOIPhone" runat="server" Text="12345678"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            送货地址：
          </td>
          <td>
            <asp:Label ID="LabOIAddress" runat="server" Text="address"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            邮编：
          </td>
          <td>
            <asp:Label ID="LabOIPostCode" runat="server" Text="510000"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            订货日期：
          </td>
          <td>
            <asp:Label ID="LabOrderDate" runat="server" Text="2014-1-1"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="style5">
            订单备注：
          </td>
          <td>
            <asp:Label ID="LabMemo" runat="server" Text="啦啦啦~"></asp:Label>
          </td>
        </tr>
    
      </table>
    </div>
  </div>
  </form>
</body>
</html>
