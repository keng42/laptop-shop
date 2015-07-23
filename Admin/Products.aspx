<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="Stylesheet" href="../CSS/Products.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="products-main">
        <div class="products-top">
            商品搜索：<asp:TextBox ID="TBKeyWord" runat="server"></asp:TextBox>
            <asp:DropDownList ID="DDLKeyType" runat="server">
                <asp:ListItem>商品名称</asp:ListItem>
                <asp:ListItem>商品编号</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="BtnSearch" runat="server" Text="搜索" OnClick="BtnSearch_Click" />
        </div>
        <div class="products-btm">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                PageSize="5" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnPageIndexChanging="GridView1_PageIndexChanging"
                CellPadding="5" CssClass="products-btm" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="SeaShell" />
                <Columns>
                    <asp:BoundField DataField="ModelNumber" HeaderText="商品编号">
                        <HeaderStyle CssClass="gv-header" Width="30%" />
                    </asp:BoundField>
                    <asp:HyperLinkField HeaderText="商品名称" DataTextField="ModelName" DataNavigateUrlFields="ProductId"
                        DataNavigateUrlFormatString="ProductEdit.aspx?ProductId={0}">
                        <HeaderStyle CssClass="gv-header" Width="20%" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="UnitCost" HeaderText="原价">
                        <HeaderStyle CssClass="gv-header" Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Discount" HeaderText="优惠价">
                        <HeaderStyle CssClass="gv-header" Width="15%" />
                    </asp:BoundField>
                    <asp:HyperLinkField HeaderText="操作" Text="删除" DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="ProductDel.aspx?ProductId={0}">
                        <HeaderStyle CssClass="gv-header" Width="10%" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField HeaderText="操作" DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="ProductCommend.aspx?ProductId={0}"
                        DataTextField="Commend">
                        <HeaderStyle CssClass="gv-header" Width="10%" />
                    </asp:HyperLinkField>
                    <asp:BoundField />
                </Columns>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                    NextPageText="下一页" Position="Top" PreviousPageText="上一页" />
                <PagerTemplate>
                    <asp:Label ID="lblPage" runat="server" Text='<%# "第" + (((GridView)Container.NamingContainer).PageIndex + 1)  + "页/共" + (((GridView)Container.NamingContainer).PageCount) + "页" %> '></asp:Label>
                    <asp:LinkButton ID="lbnFirst" runat="Server" Text="首页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'
                        CommandName="Page" CommandArgument="First"></asp:LinkButton>
                    <asp:LinkButton ID="lbnPrev" runat="server" Text="上一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'
                        CommandName="Page" CommandArgument="Prev"></asp:LinkButton>
                    <asp:LinkButton ID="lbnNext" runat="Server" Text="下一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>'
                        CommandName="Page" CommandArgument="Next"></asp:LinkButton>
                    <asp:LinkButton ID="lbnLast" runat="Server" Text="尾页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>'
                        CommandName="Page" CommandArgument="Last"></asp:LinkButton>
                </PagerTemplate>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
