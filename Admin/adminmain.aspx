<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminmain.aspx.cs" Inherits="Admin_adminmain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="../CSS/admin.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server" target="right">
    <div class="menu-block">
        <p class="menu-top-title">功能菜单</p>
        <a id="A1" runat="server" onserverclick="toindex" class="menu-title">管理首页</a>
    </div>

    <div class="menu-block">
        <p class="menu-title">订单管理</p>
        <a id="A2" runat="server" onserverclick="toorderno">未处理订单</a>
        <a id="A3" runat="server" onserverclick="toorderyes">已处理订单</a>
        <a id="A4" runat="server" onserverclick="toordertoday">今天的新订单</a>
    </div>

    <div class="menu-block">
        <p class="menu-title">商品管理</p>
        <a id="A5" runat="server" onserverclick="adminAddClass">商品分类管理</a>
        <a id="A6" runat="server" onserverclick="adminAddProduct">添加新商品</a>
        <a id="A7" runat="server" onserverclick="products">编辑商品信息</a>
    </div>

    <div class="menu-block">
        <p class="menu-title">系统管理</p>
        <a id="A8" runat="server" onserverclick="handling">商品促销信息</a>
        <a id="A9" runat="server" onserverclick="adminAddNews">网站新闻管理</a>
        <a id="A10" runat="server" onserverclick="handling">商品评论管理</a>
        <a id="A11" runat="server" onserverclick="handling">客户反馈管理</a>
        <a id="A12" runat="server" onserverclick="handling">统计调查管理</a>
    </div>

    <div class="menu-block">
        <p class="menu-title">用户管理</p>
        <a id="A13" runat="server" onserverclick="handling">客户档案管理</a>
        <a id="A14" runat="server" onserverclick="changePwd">更改管理员密码</a>
        <a id="A15" runat="server" onserverclick="logout">退出管理</a>
    </div>
    </form>
</body>
</html>
