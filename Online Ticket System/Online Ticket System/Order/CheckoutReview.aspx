<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutReview.aspx.cs" Inherits="Online_Ticket_System.Order.CheckoutReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div id="ManTitle">Checkout Review</div>
                <div>
                    <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
                    <asp:Timer ID="timer1" runat="server"
                        Interval="1000" OnTick="timer1_tick">
                    </asp:Timer>
                </div>

                <div style="margin-bottom:20px">
                    <asp:UpdatePanel ID="updPnl"
                        runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblTimer" runat="server" ForeColor="red"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="timer1" EventName="tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="border: solid thin; border-color: blue; margin-bottom: 20px;">
                    <div style="font-weight: bolder; font-size: large; background-color: darkblue; color: white">Ticket Ordered:</div>
                    <%-- <asp:GridView ID="orderlist" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="800px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Ticket #" HeaderStyle-HorizontalAlign="Left">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Ticket #]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("[Ticket #]") %>' Width="80px"></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Event Name" HeaderStyle-HorizontalAlign="Left">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Event Name]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Event Name]") %>' Width="200px"></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Date" ItemStyle-HorizontalAlign="Center">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Order Date]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Order Date]", "{0:d}") %>' Width="80px"></asp:Label>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seat Section" ItemStyle-HorizontalAlign="Center">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Seat Section]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Seat Section]") %>' Width="80px"></asp:Label>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seat Number" ItemStyle-HorizontalAlign="Center">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Seat Number]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Seat Number]") %>'></asp:Label>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Price") %>' Width="100px"></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="" Text="Delete" CssClass="btnstandard" ForeColor="White" BackColor="Red" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>--%>
                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div>
                                <asp:DataList ID="TicketList" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemCommand="TicketList_ItemCommand">
                                    <AlternatingItemStyle BackColor="#F7F7F7" />
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <ItemTemplate>
                                        <table style="width: 700px">
                                            <tr>
                                                <td rowspan="3" style="width: 25px"></td>
                                                <td rowspan="3" style="vertical-align: top">
                                                    <asp:Label ID="number" runat="server" Text='<%# Eval("Ticket#") %>'></asp:Label>
                                                </td>
                                                <td colspan="2">
                                                    <asp:Label ID="event" runat="server" Text='<%# Eval("EventName") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="price" runat="server" Text='<%# Eval("Price", "{0:c}") %>'></asp:Label>
                                                </td>
                                                <td rowspan="3" style="width: 25px"></td>

                                            </tr>
                                            <tr>
                                                <td>Seat Section:
                                        <asp:Label ID="Section" runat="server" Text='<%# Eval("SeatSection") %>'></asp:Label>
                                                </td>
                                                <td>Seat Number:
                                        <asp:Label ID="seatnum" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="Deletebtn" runat="server" Text="Delete" CssClass="btnstandard" CausesValidation="False" CommandName="Delete" ForeColor="White" BackColor="Red" OnClientClick="return confirm('Do you want to remove this ticket?')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                </asp:DataList>
                            </div>

                            <div>
                                <table style="width: 700px; text-align: right;">
                                    <tr>
                                        <td style="width: 500px">Subtotal:</td>
                                        <td>
                                            <div style="margin-right: 25px">
                                                <asp:Label ID="Subtotal" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 500px">Tax:</td>
                                        <td>
                                            <div style="margin-right: 25px">
                                                <asp:Label ID="Taxtotal" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 500px">Total:</td>
                                        <td>
                                            <div style="margin-right: 25px">
                                                <asp:Label ID="Total" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div style="border: solid thin; border-color: blue; margin-bottom: 20px;">
                    <div style="font-weight: bolder; font-size: large; background-color: darkblue; color: white">Payment Infomation:</div>
                    <div>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT dbo.tblPaymentType.Name, dbo.tblPaymentMethod.CardHolder, dbo.tblPaymentMethod.CardNumber, dbo.tblCustomer.CustomerID FROM dbo.tblPaymentMethod INNER JOIN dbo.tblPaymentType ON dbo.tblPaymentMethod.PaymentTypeID = dbo.tblPaymentType.PaymentTypeID INNER JOIN dbo.tblPayment ON dbo.tblPaymentMethod.PaymentMethodID = dbo.tblPayment.PaymentMethodID INNER JOIN dbo.tblCustomer ON dbo.tblPayment.CustomerID = dbo.tblCustomer.CustomerID WHERE (dbo.tblCustomer.CustomerID = @id)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="id" Name="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div>
                        <table style="width: 700px">
                            <tr>
                                <th style="text-align: left">Payment Type:</th>
                                <th style="text-align: left">Credit Cart No:</th>
                                <th style="text-align: left">Cardholder's Name:</th>
                                <th colspan="2" style="text-align: left">Exp. Date:</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="PaymentTypeID" CssClass="btnstandard" Height="35px" Width="130px"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT * FROM [tblPaymentType]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:TextBox ID="Cardnum" runat="server" TextMode="Number" CssClass="btnstandard" Height="30px" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Holdername" runat="server" CssClass="btnstandard" Width="170px" Height="30px"></asp:TextBox>
                                </td>
                                <td style="width: 20px">
                                    <asp:DropDownList ID="expmonth" runat="server" CssClass="btnstandard" Height="35px" Width="50px">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>

                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="expyear" runat="server" CssClass="btnstandard" Height="35px" Width="70px">
                                        <asp:ListItem>2015</asp:ListItem>
                                        <asp:ListItem>2016</asp:ListItem>
                                        <asp:ListItem>2017</asp:ListItem>
                                        <asp:ListItem>2018</asp:ListItem>
                                        <asp:ListItem>2019</asp:ListItem>
                                        <asp:ListItem>2020</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="text-align: right; margin-right: 50px; margin-bottom: 20px">
                    <asp:Button ID="MakePayment" runat="server" Text="Checkout" CssClass="btnstandard" ForeColor="White" BackColor="Green" Width="100px" Height="40px" OnClick="MakePayment_Click" />
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
