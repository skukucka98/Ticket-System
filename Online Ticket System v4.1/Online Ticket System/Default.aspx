<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Ticket_System.Display.Default" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function swapImages() {
            var $active = $('#myGallery .active');
            var $next = ($('#myGallery .active').next().length > 0) ? $('#myGallery .active').next() : $('#myGallery div:first');
            $active.fadeOut(1000, function () {
                $active.removeClass('active');
                $next.fadeIn(1000).addClass('active');
            });
        }

        $(document).ready(function () {
            // Run our swapImages() function every 5secs
            setInterval('swapImages()', 3000);
        })
    </script>
    <style>
        #myGallery {
            position: relative;
        }

            #myGallery div {
                display: none;
                top: 0;
                margin-left: auto;
                margin-right: auto;
            }

                #myGallery div.active {
                    display: block;
                }

        .normal {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div id="myGallery" style="text-align: center;">
                    <table>
                        <tr>
                            <td style="width: 50px;"></td>
                            <td style="width: 600px">
                                <asp:Label ID="pict" runat="server"></asp:Label></td>
                            <td style="width: 50px;"></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: x-large; font-weight: 300">
                        Upcoming Events:
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="UpcomeE" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="eventid" DataSourceID="SqlDataSource1" GridLines="None" PageSize="5" ForeColor="#333333">
                                <AlternatingRowStyle VerticalAlign="Middle" BackColor="White" />
                                <Columns>
                                    <asp:ImageField DataImageUrlField="picture" HeaderText="Image" SortExpression="picture" DataAlternateTextField="eventid" DataAlternateTextFormatString="~/Display/E_detail.aspx?id={0}" ItemStyle-Width="70px">
                                        <ControlStyle Height="60px" Width="60px" />
                                        <ItemStyle Width="70px" />
                                    </asp:ImageField>
                                    <asp:HyperLinkField DataNavigateUrlFields="eventid" DataNavigateUrlFormatString="~/Display/E_detail.aspx?id={0}" DataTextField="eventname" HeaderText="Events" SortExpression="eventname" ItemStyle-Width="350px" ControlStyle-ForeColor="Black" ControlStyle-Font-Underline="false">
                                        <ControlStyle Font-Underline="False" ForeColor="Black" />
                                        <ItemStyle HorizontalAlign="center" Width="400px" />
                                    </asp:HyperLinkField>
                                    <asp:TemplateField HeaderText="Date and time" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# DateTime.Parse(Eval("eventdate").ToString()) %>' Width="100px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Available">
                                        <ItemTemplate>
                                            <%# Eval("totalavailable")%>/<%#Convert.ToDecimal(Eval("totalavailable"))+Convert.ToDecimal(Eval("totalsold")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="GetUpcomingEvent" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>


