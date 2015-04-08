<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="E_detail.aspx.cs" Inherits="Online_Ticket_System.Display.E_detail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 112px;
        }

        .auto-style3 {
            width: 400px;
        }

        .Style {
            background-color: gray;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #ffffff;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 600px;
            height: 800px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <table>
                    <tr>
                        <td rowspan="4">
                            <asp:ImageButton ID="E_DetImage" runat="server" Width="200px" Height="200px" />
                        </td>
                        <td style="vertical-align: top">
                            <table>
                                <tr>
                                    <td>Event Name:</td>
                                    <td>
                                        <asp:Label ID="E_Name" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Date and Time:</td>
                                    <td>
                                        <asp:Label ID="E_DateTime" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Venue:</td>
                                    <td>
                                        <asp:Label ID="E_Venue" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Status:</td>
                                    <td>
                                        <asp:Label ID="E_Status" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Description:</td>
                                    <td>
                                        <asp:Label ID="E_Desc" runat="server"></asp:Label></td>
                                </tr>

                                </table>
                        </td>
                    </tr>
                </table>
                <div>
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </ajaxToolkit:ToolkitScriptManager>
                    
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Font-Bold="True" BorderColor="#999999">
                        <cc1:TabPanel runat="server" HeaderText="Find Your Seat" ID="FindUrSeat">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>Qty</td>
                                                    <td>Price</td>
                                                    <td>Section</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="QtyList" runat="server">
                                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                            <asp:ListItem>6</asp:ListItem>
                                                            <asp:ListItem>7</asp:ListItem>
                                                            <asp:ListItem>8</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td>
                                                        <asp:DropDownList ID="PriceList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Price" DataValueField="Price" AppendDataBoundItems="True">
                                                            <asp:ListItem Selected="True" Text="All" Value="%"></asp:ListItem>
                                                        </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT DISTINCT dbo.tblVenueSeat.Price  FROM dbo.tblEvent INNER JOIN dbo.tblSeatCategory ON dbo.tblEvent.EventID = dbo.tblSeatCategory.EventID INNER JOIN dbo.tblVenueSeat ON dbo.tblSeatCategory.SeatCategoryID = dbo.tblVenueSeat.SeatCategoryID WHERE (dbo.tblEvent.EventID = @id)">
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Decimal" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="SectionList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SeatCategoryNumber" DataValueField="SeatCategoryNumber" AppendDataBoundItems="True">
                                                            <asp:ListItem Selected="True" Text="Any" Value="%"></asp:ListItem>
                                                        </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [SeatCategoryNumber] FROM [tblSeatCategory] WHERE ([EventID] = @EventID)">
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="EventID" QueryStringField="id" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="TicketSer" runat="server" Text="Find Ticket" OnClick="TicketSer_Click" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="avlLabel" runat="server" Text="Available Seats"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="height: 400px; width: 220px; overflow: Auto">
                                                            <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" DataKeyField="SeatID">  <%--OnItemCommand="datalistcevaplar_ItemCommand"--%>
                                                                <AlternatingItemStyle BackColor="White" />
                                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle BackColor="#E3EAEB" />
                                                                <ItemTemplate>
                                                                    <table class="auto-style1">
                                                                        <%--<tr style="visibility:collapse">--%>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <asp:Label ID="SeatID" runat="server" Text='<%# Eval("SeatID") %>'></asp:Label></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style2">Seat Section</td>
                                                                            <td>
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SeatCategoryNumber") %>'></asp:Label></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style2">Seat Number</td>
                                                                            <td>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style2">Price</td>
                                                                            <td>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price", "{0:c}") %>'></asp:Label></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="3"><asp:CheckBox ID="chked_item" runat="server" Text="Add to Cart"/></td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataList>
                                                        </div>

                                                    </td>
                                                    <td style="vertical-align: text-top" class="auto-style3">
                                                        <div></div>
                                                        <div>
                                                            <asp:ImageButton ID="ImageButton" runat="server" Height="400px" Width="400px" ImageUrl="~/Images/seat diagram.jpg" />
                                                            <cc1:ModalPopupExtender ID="modalPopup" runat="server" TargetControlID="ImageButton" PopupControlID="Panel1" BackgroundCssClass="Style" OkControlID="Button1" BehaviorID="modalPopup" Enabled="True"></cc1:ModalPopupExtender>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="Buybtn" runat="server" Text="Buy Ticket" Height="25px" Width="110px" OnClick="Buybtn_Click" /> <%--OnClientClick="return confirm('You have 5 minute to pay for your ticket. Continue?')" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                       <%-- <cc1:TabPanel ID="FindbyRange" runat="server" HeaderText="Find by Range Price">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Image ID="D2_Diagram" runat="server" Width="300px" Height="300px" /></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>--%>
                    </cc1:TabContainer>

                </div>
            </td>
            <td id="RightContent"></td>
        </tr>

    </table>
    <asp:Panel ID="Panel1" runat="server" Width="600px" Height="700px" Style="display: none">
        <div id="seatimage">
            <asp:Image ID="Image1" runat="server" Height="600px" Width="700px" ImageUrl="~/Images/seat diagram.jpg" />
            <asp:Button ID="Button1" runat="server" Text="Close" />
        </div>
    </asp:Panel>
</asp:Content>
