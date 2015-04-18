<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="E_SubCat.aspx.cs" Inherits="Online_Ticket_System.Display.E_SubCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div id="Content">
        <table>
            <tr>
                <th id="LeftContent" style="width: 200px;"></th>
                <th id="CenterContent" style="width: 900px">
                    <div>
                        <asp:Label ID="ESubCat_Mes" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    <div style="text-align: left; font-size: x-large">
                        <asp:Label ID="value" runat="server"></asp:Label>
                       <%-- <asp:DropDownList ID="E_SubcatList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="E_SubcatList_SelectedIndexChanged" CssClass="dropdownList">
                        </asp:DropDownList>--%>
                    </div>
                    <div style="height: 500px; overflow: auto">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="UpcomeE" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderWidth="3px" CellPadding="4" DataKeyNames="eventid" GridLines="Horizontal" BorderStyle="Double">
                                    <AlternatingRowStyle VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:TemplateField SortExpression="picture">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("picture") %>' ToolTip='<%# Eval("eventid", "~/Display/E_detail.aspx?id={0}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <%--<asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("eventid", "~/Display/E_detail.aspx?id={0}") %>' ImageUrl='<%# Eval("picture") %>' />--%>
                                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("picture") %>' PostBackUrl='<%# Eval("eventid", "~/Display/E_detail.aspx?id={0}") %>' />
                                            </ItemTemplate>
                                            <ControlStyle ForeColor="DarkBlue" Height="60px" Width="60px" />
                                            <ItemStyle Font-Bold="True" Width="70px" />
                                        </asp:TemplateField>
                                        <asp:HyperLinkField DataNavigateUrlFields="eventid" DataNavigateUrlFormatString="~/Display/E_detail.aspx?id={0}" DataTextField="eventname" HeaderText="Events" SortExpression="eventname" ItemStyle-Width="250px">
                                            <ControlStyle Font-Underline="False" ForeColor="DarkBlue" />
                                            <ItemStyle HorizontalAlign="center" Width="400px" Font-Bold="True" />
                                        </asp:HyperLinkField>
                                        <asp:TemplateField HeaderText="Date and time" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="false" Text='<%# DateTime.Parse(Eval("eventdate").ToString()) %>' Width="110px"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Available">
                                            <ItemTemplate>
                                                <%# Eval("totalavailable")%>/<%#Convert.ToDecimal(Eval("totalavailable"))+Convert.ToDecimal(Eval("totalsold")) %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" Font-Bold="false" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Venue" HeaderText="Venue" ItemStyle-Width="250">
                                            <ItemStyle Width="250px" Font-Bold="false" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="False" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="GetUpcomingEvent" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </th>
                <th id="RightContent" style="width: 200px"></th>
            </tr>
        </table>
    </div>
</asp:Content>

