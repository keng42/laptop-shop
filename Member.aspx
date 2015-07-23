<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link rel="Stylesheet" type="text/css" href="CSS/Member.css" />
  <title>会员中心</title>
  <script type="text/javascript">
    function goBasicInfo(obj) {
      obj.className = "nav-list nav-highlight";
      document.getElementById("divOrderInfo").className = "nav-list";
      document.getElementById("detail").style.display = "block";
      document.getElementById("orderinfo").style.display = "none";
    }
    function goOrderInfo(obj) {
      obj.className = "nav-list nav-highlight";
      document.getElementById("divBasicInfo").className = "nav-list";
      document.getElementById("detail").style.display = "none";
      document.getElementById("orderinfo").style.display = "block";
    }
  </script>
</head>
<body onload="setheight(this)">
  <form id="form1" runat="server">
  <div id="main">
    <div id="header">
      会员中心
    </div>
    <div id="nav">
      <div class="nav-list nav-highlight" onclick="goBasicInfo(this)" id="divBasicInfo">
        <span class="span1"></span>账户信息</div>
      <div class="nav-list" onclick="goOrderInfo(this)" id="divOrderInfo">
        <span class="span1"></span>订单信息</div>
      <div class="nav-list">
        <span class="span1"></span><a id="homepage" href="Default.aspx">返回首页</a></div>
    </div>
    <div id="detail">
      <div class="title">
        账户信息<a id="change" runat="server" onserverclick="savechange">修改信息</a>
      </div>
      <div class="line">
      </div>
      <table>
        <tr>
          <td class="detail-list">
            昵称
          </td>
          <td class="detail-content">
            <%--<p runat="server" id="p_nick">Keng</p>--%>
            <asp:TextBox ID="p_nick" runat="server">Keng</asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            电子邮箱
          </td>
          <td class="detail-content">
            <p runat="server" id="p_email">
              i@keng.org</p>
            <a>管理邮箱地址</a>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            密码
          </td>
          <td class="detail-content">
            <asp:TextBox ID="p_pwd" runat="server">******</asp:TextBox>
            <%--<br />
                        <a>修改密码</a>--%>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            电话
          </td>
          <td class="detail-content">
            <asp:TextBox ID="p_phone" runat="server">23333333</asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            手机
          </td>
          <td class="detail-content">
            <asp:TextBox ID="p_mobile" runat="server">13512345678</asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            地址
          </td>
          <td class="detail-content">
            <asp:TextBox ID="p_address" runat="server">中南海96号</asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="detail-list">
            邮编
          </td>
          <td class="detail-content">
            <asp:TextBox ID="p_code" runat="server">100000</asp:TextBox>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <a id="Logout" runat="server" onserverclick="logout" class="btn-logout">注销</a>
          </td>
        </tr>
      </table>
    </div>
    <div id="orderinfo">
      <asp:GridView ID="GridView1" runat="server" CssClass="ordertable" AutoGenerateColumns="False"
        OnRowDataBound="GridView1_RowDataBound">
        <Columns>
          <asp:BoundField HeaderText="订单号" DataField="ID">
            <HeaderStyle Width="10%" />
          </asp:BoundField>
          <asp:BoundField DataField="ModelName" HeaderText="商品名称">
            <HeaderStyle Width="30%" />
          </asp:BoundField>
          <asp:BoundField DataField="ModelNumber" HeaderText="规格型号">
            <HeaderStyle Width="20%" />
          </asp:BoundField>
          <asp:BoundField HeaderText="数量" DataField="Quantity">
            <HeaderStyle Width="8%" />
          </asp:BoundField>
          <asp:BoundField HeaderText="单价" DataField="Unitcost" DataFormatString="{0:c}">
            <HeaderStyle Width="8%" />
          </asp:BoundField>
          <asp:BoundField HeaderText="订单总价" DataField="Subtotal" DataFormatString="{0:c}">
            <HeaderStyle Width="12%" />
          </asp:BoundField>
          <asp:BoundField HeaderText="订单状态" DataField="HasCheck">
            <HeaderStyle Width="12%" />
          </asp:BoundField>
        </Columns>
      </asp:GridView>
      <%--具体商品、数量、单价、订单总价、订单状态--%>
    </div>
  </div>
  </form>
</body>
</html>
