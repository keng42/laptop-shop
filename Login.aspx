<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="./CSS/userLogin.css" />
  <title>用户登录</title>
</head>
<body>
  <form runat="server">
  <p id="p_login" class="text_shadow">
    登陆入口</p>
  <div id="div_center">
    <div>
      <div class="star">
        *</div>
      电子邮件：<input id="text_email" type="text" class="text_style" runat="server" onclick="return text_email_onclick()" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空"
        ControlToValidate="text_email" ForeColor="red"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="电子邮件格式错误"
        ControlToValidate="text_email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div>
      <div class="star">
        *</div>
      登陆密码：<input id="pwd" type="password" class="text_style" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空"
        ControlToValidate="pwd" ForeColor="red"></asp:RequiredFieldValidator>
      <input type="checkbox" runat="server" id="AutoLogin" />自动登陆
      <input type="button" id="btn_login" value="开始登录" onserverclick="BtnLoginClick" runat="server" />
    </div>
    <div id="div_login_tips">
      <p>
        没有账户？ <a href="Register.aspx">注册</a></p>
      <p class="text_shadow">
        登录提示</p>
      1.带<div class="star">
        *</div>
      项必须填写<br />
      2.关于自动登录：如果您现在使用的是共用计算机，处于安全考虑，请慎用<br />
      3.如果您忘记了使用的‘电子邮件’或‘登录密码’，请按此找回您的资料<br />
      4.如果您还没有注册，请按此进行免费注册，享受更超值的服务
    </div>
  </div>
  </form>
</body>
</html>
