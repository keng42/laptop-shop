<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <style type="text/css">
    #header
    {
      background-color: #CCCCCC;
      height: 100px;
      text-align: left;
      line-height: 100px;
      font-size: 20px;
      text-shadow: 3px 3px 1px black;
    }
    .text_shadow
    {
      text-shadow: 3px 3px 1px black;
    }
    .star
    {
      margin: 0;
      padding: 0;
      color: red;
      display: inline;
    }
    #Btn_reg
    {
      height: 32px;
      width: 84px;
    }
  </style>
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <div id="header">
      用户注册
    </div>
    <div>
      <div class="star">
        *</div>
      电子邮件：<input type="text" id="text_email" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_email"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="text_email"
        ErrorMessage="电子邮件格式错误" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      登陆密码：<input type="password" id="text_loginpwd" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_loginpwd"></asp:RequiredFieldValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      确认密码：<input type="password" id="text_confirmpwd" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_confirmpwd"></asp:RequiredFieldValidator>
      <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="text_loginpwd"
        ControlToValidate="text_confirmpwd" ErrorMessage="密码不一致" ForeColor="Red"></asp:CompareValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      昵 称：<input type="text" id="text_nick" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_nick"></asp:RequiredFieldValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      电 话：<input type="text" id="text_phone" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_phone"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="text_phone"
        ErrorMessage="电话格式错误" ForeColor="Red" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}"></asp:RegularExpressionValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      手 机：<input type="text" id="text_mobile" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_mobile"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="text_mobile"
        ErrorMessage="手机格式错误" ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      地 址：<input type="text" id="text_address" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_address"></asp:RequiredFieldValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      邮 编：<input type="text" id="text_code" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="必填"
        ForeColor="Red" ControlToValidate="text_code"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="text_code"
        ErrorMessage="邮编格式错误" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
    </div>
    <div>
      <br />
      <input type="submit" id="Btn_reg" value="注册" runat="server" onserverclick="RegisterBtnClick" />
    </div>
  </div>
  </form>
</body>
</html>
