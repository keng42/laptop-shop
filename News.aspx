<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link rel="Stylesheet" type="text/css" href="CSS/FrontPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div class="news-main">
    <asp:Label ID="NewsName" runat="server" Text="新闻标题" CssClass="news-name"></asp:Label>
    <asp:Label ID="NewsTime" runat="server" Text="发布时间： Time" CssClass="news-time"></asp:Label>
    <asp:Label ID="NewsMemo" runat="server" Text="新闻正文" CssClass="news-memo"></asp:Label>
  </div>
</asp:Content>
