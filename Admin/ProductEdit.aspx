<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="Admin_ProductEdit"
  ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link type="text/css" rel="Stylesheet" href="../CSS/Products.css" />
  <link rel="stylesheet" type="text/css" href="../CSS/adminAddProduct.css" />
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <div id="main">
      <p id="p_add_product">
        编辑商品信息</p>
      <table>
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
            图片
          </td>
          <td>
            <input id="text_img" type="text" runat="server" />
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
            <%--<asp:Button ID="btn_add" runat="server" class="button" Text="更新"
                            onserverclick="btn_add_Click" />--%>
            <input id="btn_add" type="Submit" class="button" value="更新" onserverclick="AddBtnClick"
              runat="server" />
          </td>
        </tr>
      </table>
    </div>
  </div>
  </form>
</body>
</html>
