<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminAddNews.aspx.cs" Inherits="Admin_adminAddNews"
  ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="../CSS/adminAddNews.css" />
  <title>添加新闻</title>
</head>
<body>
  <form runat="server">
  <div>
    新闻类型：<select id="select_menu" runat="server">
      <option id="Option1" value="" runat="server"></option>
      <option id="Option2" value="分类1" runat="server">分类1</option>
      <option id="Option3" value="分类2" runat="server">分类2</option>
      <option id="Option4" value="分类3" runat="server">分类3</option>
      <option id="Option5" value="分类4" runat="server">分类4</option>
    </select>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="select_menu"
      ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>s
  </div>
  <div>
    新闻标题：<input id="text_title" type="text" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填"
      ForeColor="red" ControlToValidate="text_title"></asp:RequiredFieldValidator>
  </div>
  <p>
    新闻内容：</p>
  <textarea id="ta_content" rows="5" cols="100" runat="server"></textarea>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填"
    ForeColor="red" ControlToValidate="ta_content"></asp:RequiredFieldValidator>
  <div>
    <input id="btn_send" type="submit" value="发布新闻" onserverclick="BtnSendClick" runat="server" /></div>
  </form>
</body>
</html>
