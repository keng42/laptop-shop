<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" RepeatColumns="4" runat="server" Width="100%" BorderColor="#CC9966"
            BorderStyle="None" BackColor="White" CellPadding="4" GridLines="Both" BorderWidth="1px"
            ShowHeader="False" ShowFooter="False" RepeatDirection="Horizontal">
            <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
            <AlternatingItemStyle BackColor="Snow"></AlternatingItemStyle>
            <ItemStyle ForeColor="#330099" BorderStyle="Dashed" BackColor="White"></ItemStyle>
            <ItemTemplate>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td valign="top" align="middle">
                            <a href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                                title="点击查看明细">
                                <img src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                                    border="0" width="100px" height="100px">
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
                                </font></a>
                            <br>
                            &nbsp;&nbsp;<a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'><img
                                src="Images/ShoppingCart.gif" border="0" title="点击订单此商品"></a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
            <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
        </asp:DataList>
        <%--        <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" CellPadding="4" BackColor="White"
            BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966" AutoGenerateColumns="False">
            <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
            <AlternatingItemStyle BackColor="SeaShell"></AlternatingItemStyle>
            <ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
            <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
            <FooterStyle ForeColor="#FF0066" BackColor="#FFFFCC" Font-Bold="False" Font-Italic="False"
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></FooterStyle>
            <Columns>
                <asp:BoundColumn DataField="ModelNumber" HeaderText="商品编号">
                    <HeaderStyle Width ="60px"></HeaderStyle>
                </asp:BoundColumn>
                <asp:HyperLinkColumn DataNavigateUrlField="ProductId" DataNavigateUrlFormatString="productEdit.aspx?ProductId={0}"
                    DataTextField="ModelName" HeaderText="商品名称"></asp:HyperLinkColumn>
                <asp:BoundColumn DataField="UnitCost" HeaderText="原价" DataFormatString="{0:c}">
                    <HeaderStyle Width="60px"></HeaderStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Discount" HeaderText="优惠价" DataFormatString="{0:c}">
                    <HeaderStyle Width="60px"></HeaderStyle>
                </asp:BoundColumn>
                <asp:HyperLinkColumn Text="删除" DataNavigateUrlField="ProductId" DataNavigateUrlFormatString="ProductDel.aspx?ProductId={0}"
                    HeaderText="操作">
                    <HeaderStyle Width="50px"></HeaderStyle>
                </asp:HyperLinkColumn>
                <asp:HyperLinkColumn Text="推荐" DataNavigateUrlField="ProductId" DataNavigateUrlFormatString="ProductCommend.aspx?ProductId={0}"
                    HeaderText="操作">
                    <HeaderStyle Width="50px"></HeaderStyle>
                </asp:HyperLinkColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
        </asp:DataGrid>--%>
    </div>
    </form>
</body>
</html>
