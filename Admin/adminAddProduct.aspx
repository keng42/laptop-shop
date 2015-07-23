<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminAddProduct.aspx.cs"
    Inherits="Admin_adminAddProduct" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../CSS/adminAddProduct.css" />
    <title>添加新产品</title>
</head>
<body runat="server">
    <form id="form1" runat="server">
    <div id="main">
        <p id="p_add_product">
            添加商品</p>
        <table>
            <tr>
                <td>
                    <p>
                        一级分类</p>
                </td>
                <td>
                    <asp:DropDownList ID="select_menu" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="select_menu"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    产品名称
                </td>
                <td>
                    <input id="text_name" type="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="text_name"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    详细介绍
                </td>
                <td>
                    <textarea id="textarea_detail" rows="5" cols="100" wrap="virtual" runat="server"></textarea>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textarea_detail"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    编号
                </td>
                <td>
                    <input id="text_code" type="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="text_code"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    图片
                </td>
                <td>
                    <asp:FileUpload ID="File1" runat="server" />
                    <input id="btn_upload" type="button" class="button" value="上传" onserverclick="uploadImg"
                        runat="server" /><br />
                    <asp:Label ID="Img" runat="server" />
                    <input id="text_img" type="text" runat="server" visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    价格
                </td>
                <td>
                    <input id="text_price" type="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="text_price"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    会员价
                </td>
                <td>
                    <input id="text_vipprice" type="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="text_vipprice"
                        ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <input id="btn_add" type="Submit" class="button" value="添加" onserverclick="AddBtnClick"
                        runat="server" />
                    <input id="btn_cancle" type="button" class="button" value="取消" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
