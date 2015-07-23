<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminAddClass.aspx.cs" Inherits="Admin_adminAddClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="Stylesheet" href="../CSS/adminAddClass.css" />
    <script type="text/javascript">
        function onchecknull(sender, args) {
            txt = document.getElementById("text_add");
            if (txt.value == "") {
                document.getElementById("Btn_add").disabled = true;
            } else {
                oncheck();
                document.getElementById("Btn_add").disabled = false;
            }   
        }

        function oncheck(sender, args) {
            lst = document.getElementById('ListBox1');
            lst.selectedIndex = -1;
            var search_value = sender.value.toUpperCase();
            for (var i = 0; i < lst.options.length; i++) {
                if (lst.options[i].text.toUpperCase() == search_value) {
                    lst.options[i].selected = true;
                    document.getElementById("Btn_add").disabled = true;
                    break;
                }
                else {
                    document.getElementById("Btn_add").disabled = false;
                }
            }
        }

    </script>
    <title>一级栏目管理</title>
</head>
<body onload="onchecknull()">
    <form id="form1" runat="server">
    <table align="center" class="style1" id="main">
        <tr>
            <td align="center" colspan="2" id="p_add_class">
                <asp:Label runat="server" Text="一级栏目管理"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="添加一级栏目：" Width="150px"></asp:Label>
                <asp:TextBox ID="text_add" runat="server" Width="200px" onkeyup="oncheck(this)" onblur="onchecknull(this)"></asp:TextBox>
                <input type="button" id="Btn_add" runat="server" value="增加" onserverclick="Btn_add_Click" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Width="150px"></asp:Label>
                <asp:ListBox ID="ListBox1" runat="server" Width="200px" Height="150px">
                </asp:ListBox>
                <input type="button" id="Btn_del" runat="server" value="删除" onserverclick="Btn_del_Click" />
            </td>
            <td align="left" valign="top">
                注意：删除后将不能恢复，请慎重操作。栏目大类一经删除，所有子类栏目和商品都将同时删除。
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
