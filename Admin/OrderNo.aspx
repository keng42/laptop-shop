<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderNo.aspx.cs" Inherits="Admin_OrderNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link type="text/css" rel="Stylesheet" href="../CSS/Products.css" />
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <div class="ontitle"><asp:Label ID="LabCheck" runat="server" Text="未处理订单"></asp:Label></div>
    <div class="onsearchbar">
      订单号查询:<asp:TextBox ID="TBKeyword" runat="server"></asp:TextBox><asp:DropDownList ID="DDLType"
        runat="server">
        <asp:ListItem Value="all">所有订单</asp:ListItem>
        <asp:ListItem Value="no">未处理</asp:ListItem>
        <asp:ListItem Value="yes">已处理</asp:ListItem>
        <asp:ListItem Value="now">今天新增</asp:ListItem>
      </asp:DropDownList>
      <asp:Button ID="BtnSearch" runat="server" Text="搜索" onclick="BtnSearch_Click" />
    </div>
    <div>
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="20" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="100%">
        <Columns>
          <asp:BoundField DataField="ID" HeaderText="订单号" />
          <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="OrderInfo.aspx?type=cart&id={0}"
            HeaderText="购物清单" Text="查看清单" />
          <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="OrderInfo.aspx?type=user&id={0}"
            HeaderText="用户资料" Text="查看资料" />
          <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="OrderInfo.aspx?type=order&id={0}"
            HeaderText="送货事宜" Text="详细资料" />
          <asp:BoundField DataField="Name" HeaderText="收货人" />
          <asp:BoundField DataField="email" HeaderText="Email" />
          <asp:BoundField DataField="MobilePhone" HeaderText="联系电话" />
          <asp:BoundField DataField="Datetimed" HeaderText="订货时间" />
          <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="OrderInfo.aspx?type=check&id={0}"
            HeaderText="操作" Text="处理" />
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
    </div>
  </div>
  </form>
</body>
</html>
