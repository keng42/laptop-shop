<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminLogin.aspx.cs" Inherits="Admin_adminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../CSS/adminLogin.css" />
<title>管理员登录</title>
</head>

<body>
<form runat="server">
    <div id="main">
        <p>管理员登录</p>
        <div>用户名：<input id="text_username" type="text" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="不能为空" ControlToValidate="text_username" ForeColor="Red" ></asp:RequiredFieldValidator> 
        </div>
        <div>密 码： <input id="pwd" type="password" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="不能为空" ControlToValidate="pwd" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div><input type="submit" id="btn_login" value="登录" onserverclick="BtnLoginClick" runat="server" /></div>
        <div id="tips">
            <br/>
            <br/>
            默认管理员：admin<br/>
            默认密码：admin            
        </div>
    </div>
</form>
</body>
</html>