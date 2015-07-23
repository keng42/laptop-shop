<%@ Page Language="C#" AutoEventWireup="true" CodeFile="oldSearchProducts.aspx.cs" Inherits="SearchProducts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="Stylesheet" href="CSS/FrontPage.css" />
    <title></title>
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label id="keyword" runat="server">
        </label>
        <p class="display-inline">
            商品信息（名称或编号）：</p>
        <input type="text" runat="server" id="txtkeyword" />
        <input id="Submit1" type="submit" value="查找" runat="server" onserverclick="SearchInDB" />
        <hr />
        <p class="display-inline">
            &nbsp;</p>
        &nbsp;<br />
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="6" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>
                    <tr>
                        <td valign="top" align="middle">
                            <a target="view_window" href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
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
                                </font></a>&nbsp;&nbsp;<br>
                            <a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                <img alt="" src="ProductImages/ShoppingCart.gif" border="0" title="点击订单此商品"></a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
