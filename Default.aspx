<%@ Page Title="" Language="C#" MasterPageFile="~/FrontPage.master" AutoEventWireup="true"
  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link rel="Stylesheet" type="text/css" href="CSS/FrontPage.css" />
  <style type="text/css">
    .style4
    {
      width: 100%;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div id="default-main">
    <div id="left">
      <div id="tab-hotclick">
        <asp:GridView ID="GridView2" runat="server" PageSize="6" Width="100%" AutoGenerateColumns="False"
          CellPadding="4" ForeColor="#000000" GridLines="None" Font-Italic="False" Font-Size="18px"
          OnRowDataBound="GridView_RowDataBound">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="ModelName" DataTextFormatString="{0}" HeaderText="所有热门商品">
              <HeaderStyle Width="70%" Font-Bold="True" ForeColor="Black" HorizontalAlign="Left"
                CssClass="title" Height="45px" VerticalAlign="Top" Wrap="True" />
              <ItemStyle CssClass="normalfont" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="Clicks" DataTextFormatString="{0}" HeaderText="点" ItemStyle-CssClass="data">
              <ItemStyle CssClass="data"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="Sales" DataTextFormatString="{0}" HeaderText="销" />
          </Columns>
          <EditRowStyle BackColor="#999999" />
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#e5e5e5" Font-Bold="True" ForeColor="White" Height="40px" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <%--<SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
        </asp:GridView>
        <div class="more">
          <a href="ProductsTop.aspx?Type=Clicks">更多产品</a></div>
      </div>
      <div id="tab-hotsale">
        <asp:GridView ID="GridView3" runat="server" PageSize="6" Width="100%" AutoGenerateColumns="False"
          CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="ModelName" DataTextFormatString="{0}" HeaderText="所有热销商品">
              <ControlStyle ForeColor="Black" />
              <HeaderStyle Width="70%" CssClass="title" ForeColor="Black" Height="45px" HorizontalAlign="Left"
                VerticalAlign="Top" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="Clicks" DataTextFormatString="{0}" HeaderText="点" />
            <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="Product.aspx?ProductId={0}"
              DataTextField="Sales" DataTextFormatString="{0}" HeaderText="销" />
          </Columns>
          <EditRowStyle BackColor="#999999" />
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#e5e5e5" Font-Bold="True" ForeColor="White" Height="40px" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="data" Font-Size="18px"
            Height="30px" VerticalAlign="Middle" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <%--<SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
        </asp:GridView>
        <div class="more">
          <a href="ProductsTop.aspx?Type=Sales">更多产品</a></div>
      </div>
      <div id="tab-new">
        <div class="title">
          最新商品</div>
        <asp:DataList ID="DataList2" runat="server" Width="100%">
          <ItemTemplate>
            <table class="style4">
              <tr>
                <div class="card-h">
                  <a href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                    title="点击查看明细">
                    <img alt="" src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                      border="0" width="100px" height="100px">
                    <%# DataBinder.Eval(Container.DataItem, "ModelNumber") %>
                    -
                    <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
                    <br>
                    <font color="silver"><del>
                      <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
                    </del></font>
                    <br>
                    <font color="coral">
                      <%# DataBinder.Eval(Container.DataItem, "Discount", "{0:c}") %>
                    </font></a>&nbsp;&nbsp;&nbsp;&nbsp;</div>
              </tr>
            </table>
          </ItemTemplate>
        </asp:DataList>
        <div class="more">
          <a href="ProductsTop.aspx?Type=Datetimed">更多产品</a></div>
      </div>
    </div>
    <div id="right">
      <div id="tab-news">
        <div class="title">
          最新消息</div>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" AutoGenerateColumns="False"
          Width="100%" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
          PageSize="5" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
            <asp:HyperLinkField DataTextField="Name" HeaderText="标题">
              <HeaderStyle Width="25%" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Memo" HeaderText="内容" />
            <asp:BoundField DataField="DateTimed" HeaderText="时间">
              <HeaderStyle Width="25%" />
            </asp:BoundField>
          </Columns>
          <EditRowStyle BackColor="#999999" />
          <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
          <HeaderStyle BackColor="#C1D739" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="40px" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <%--<SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
        </asp:GridView>
      </div>
      <div id="tab-recom">
        <div class="title">
          诚意推荐
        </div>
        <div>
          <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
              <table>
                <tr>
                  <td valign="top" align="middle" class="card">
                    <a target="view_window" href='Product.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                      title="点击查看明细">
                      <img src='ProductImages/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                        border="0" width="100%" height="60%">
                      <br>
                      </div class="card-bottom">
                      <%# DataBinder.Eval(Container.DataItem, "ModelNumber") %>
                      -
                      <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
                      <br>
                      <font color="silver"><del>
                        <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
                      </del></font>
                      <br>
                      <font color="coral">
                        <%# DataBinder.Eval(Container.DataItem, "Discount", "{0:c}") %>
                      </font></a>&nbsp;&nbsp;<br>
                    <a href='<%# "AddToCart.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                      </div>
                      <img alt="" src="ProductImages/ShoppingCart.gif" border="0" title="点击订单此商品"></a>
                  </td>
                </tr>
              </table>
            </ItemTemplate>
          </asp:DataList>
        </div>
      </div>
    </div>
  </div>
</asp:Content>