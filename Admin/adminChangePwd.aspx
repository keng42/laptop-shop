<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminChangePwd.aspx.cs" Inherits="Admin_adminChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      原密码：<input id="TBOldPwd" type="password" runat="server" />
      <br />
      新密码：<input id="TBNewPwd" type="password" runat="server" />
      <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="TBComPwd" ControlToValidate="TBNewPwd" ErrorMessage="密码不一致" 
        ForeColor="Red"></asp:CompareValidator>
      <br />
      确认密码：<input id="TBComPwd" type="password" runat="server" />
      <br />
      <asp:Button ID="BtnSave" runat="server" Text="修改" onclick="BtnSave_Click" />
    </div>
    </form>
</body>
</html>
