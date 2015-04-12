<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="Online_Ticket_System.Create.CreateEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table>
        <tr>
            <th id="LeftContent"></th>
            <th id="CenterContent">
                <div id="CEContent">
                    <div id="ManTitle">CREATE NEW EVENT</div>
                    <div>
                        <table class="ticketTable">
                            <tr>
                                <td style="width: 200px; text-align: right">Name:</td>
                                <td style="width: 495px; text-align: left">
                                    <asp:TextBox ID="txtEventName" runat="server" Width="300px" ValidationGroup="AddEvent" CssClass="CrBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEventName" ErrorMessage="*" ValidationGroup="AddEvent" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Date:</td>
                                <td style="width: 495px; text-align: left">
                                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server"></cc1:ToolkitScriptManager>
                                    <asp:TextBox ID="txtEventDate" runat="server" Width="300px" ValidationGroup="AddEvent" CssClass="CrBox"></asp:TextBox>
                                    <cc1:CalendarExtender ID="txtEventDate_CalendarExtender" runat="server" TargetControlID="txtEventDate">
                                    </cc1:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEventDate" ErrorMessage="*" ValidationGroup="AddEvent" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Time:</td>
                                <td style="width: 495px; text-align: left">
                                    <asp:TextBox ID="txtEventTime" runat="server" Width="300px" ValidationGroup="AddEvent" TargetControlID="txtEventTime" CssClass="CrBox"></asp:TextBox>
                                    <cc1:DropDownExtender ID="txtEventTime_DropDownExtender" runat="server" TargetControlID="txtEventTime" DropDownControlID="ListBox1">
                                    </cc1:DropDownExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEventTime" ErrorMessage="*" ValidationGroup="AddEvent" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:ListBox ID="ListBox1" runat="server" Style="display: none; visibility: hidden;" AutoPostBack="true" OnSelectedIndexChanged="ListBox_SelectedIndexChanged">
                                        <asp:ListItem>10:00:00</asp:ListItem>
                                        <asp:ListItem>11:00:00</asp:ListItem>
                                        <asp:ListItem>12:00:00</asp:ListItem>
                                        <asp:ListItem>13:00:00</asp:ListItem>
                                        <asp:ListItem>14:00:00</asp:ListItem>
                                        <asp:ListItem>15:00:00</asp:ListItem>
                                        <asp:ListItem>16:00:00</asp:ListItem>
                                        <asp:ListItem>17:00:00</asp:ListItem>
                                        <asp:ListItem>18:00:00</asp:ListItem>
                                        <asp:ListItem>19:00:00</asp:ListItem>
                                        <asp:ListItem>20:00:00</asp:ListItem>
                                        <asp:ListItem>21:00:00</asp:ListItem>
                                        <asp:ListItem>22:00:00</asp:ListItem>
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Venue:</td>
                                <td class="auto-style2" style="text-align: left">
                                    <div>
                                        <asp:DropDownList ID="VenueIDDd" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="VenueID" ValidationGroup="AddEvent" AutoPostBack="True" CssClass="CrDrDown">
                                            <asp:ListItem Selected="True" Value="Please Select a Venue">Please Select a Venue</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [VenueID], [Name] FROM [tblVenue]"></asp:SqlDataSource>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Seat level:</td>
                                <td class="auto-style2" style="text-align: left">
                                    <div>
                                        <asp:DropDownList ID="SeatDropDown" runat="server" DataSourceID="SqlDataSource8" DataTextField="Section" DataValueField="Section" CssClass="CrSmallDrDown">
                                            <asp:ListItem Selected="True" Value="Please Select Seat level">Please Select Seat level</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [Section], [ID] FROM [tblVenueInfo] WHERE ([VenueID] = @VenueID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="VenueIDDd" Name="VenueID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        Price
                                                <asp:TextBox ID="txtPrice" runat="server" Width="66px" ValidationGroup="AddEvent" CssClass="CrSmalBox"></asp:TextBox>
                                        <asp:Button ID="price" runat="server" Text="Add Price" OnClick="price_Click" CssClass="CrEButt" />
                                        <asp:Label ID="lbPrice" runat="server"></asp:Label>
                                    </div>
                                    <br />

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Category ID:</td>
                                <td style="width: 495px; text-align: left">

                                    <asp:DropDownList ID="SelectEventCategory" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="EventCategoryID" ValidationGroup="AddEvent" CssClass="CrDrDown">
                                        <asp:ListItem Selected="True">Please Select a Category</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [EventCategoryID], [Name] FROM [tblEventCategory] WHERE ([ParentCategoryID] IS NOT NULL)"></asp:SqlDataSource>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Image:</td>
                                <td style="width: 495px; text-align: left">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    <asp:Button ID="btnUploadImage" runat="server" Text="Upload" OnClick="btnUploadImage_Click1" CssClass="CrEButt" />
                                </td>

                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">Description:</td>
                                <td style="width: 495px; text-align: left">

                                    <asp:TextBox ID="txtDescription" runat="server" Height="98px" TextMode="MultiLine" Width="340px" ValidationGroup="AddEvent" CssClass="CrBox"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left">
                                    <asp:Button ID="buttonSave" runat="server" Text="Save" OnClick="buttonSave_Click" ValidationGroup="AddEvent" CssClass="CrEButt" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left">
                                    <asp:Label ID="lbOutPut" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <br />
                        <br />
                        <div id="gridevent" runat="server">
                            <asp:GridView ID="EventGrid" runat="server">
                            </asp:GridView>
                        </div>
                        <br />
                        <div>
                            <h2 style="text-align: left">Event Management</h2>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server"
                                        AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
                                        GridLines="None" Height="539px" DataKeyNames="Eventid" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Event Name" SortExpression="Name" ControlStyle-Width="300px" ItemStyle-HorizontalAlign="Left">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>

                                                <ControlStyle Width="250px"></ControlStyle>

                                                <HeaderStyle HorizontalAlign="Left" />

                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SubCategory" SortExpression="SubCategory" HeaderStyle-HorizontalAlign="Left">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubCategory") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubCategory") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ControlStyle Width="200px" />

                                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:d}" />
                                            <asp:BoundField DataField="EventTime" HeaderText="EventTime" SortExpression="EventTime" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" />
                                            <asp:TemplateField HeaderText="Manage" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Detail" CssClass="btnstandard" Width="75" Height="35" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Panel ID="Panel1" runat="server" CssClass="Popup">
                                <div style="background-color: lightgray">
                                    <div style="position: relative; margin-bottom: 3px; top: 3px; margin-right: 10px; text-align: right;">
                                        <asp:Button ID="CloseBtn" runat="server" Text="X" CssClass="lbl" />
                                        <cc1:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="CloseBtn" PopupControlID="panel1" CancelControlID="CloseBtn" BackgroundCssClass="jsMpeBackground">
                                        </cc1:ModalPopupExtender>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div style="background-color: white; margin-left: 2px; margin-right: 2px">
                                                <div>Event Detail</div>
                                                <div>
                                                    <asp:DetailsView ID="eDetails" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" GridLines="Vertical" Height="50px" Width="125px" DataKeyNames="EventID">
                                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                                        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                        <Fields>
                                                            <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                            <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                                                            <asp:BoundField DataField="EventTime" HeaderText="EventTime" SortExpression="EventTime" />
                                                            <asp:BoundField DataField="VenueID" HeaderText="VenueID" SortExpression="VenueID" />
                                                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                                                        </Fields>
                                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" DeleteCommand="DELETE FROM dbo.tblEvent WHERE (EventID = @EventID)" SelectCommand="SELECT EventID, Name, EventDate, EventTime, VenueID, CategoryID, Description FROM dbo.tblEvent WHERE (EventID = @EventID)" UpdateCommand="UPDATE dbo.tblEvent SET Name = @Name, EventDate = @EventDate, EventTime = @EventTime, VenueID = @VenueID, Status = @Status, CategoryID = @CategoryID, Description = @Description WHERE (EventID = @EventID)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="EventID" />
                                                        </DeleteParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="GridView1" Name="EventID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="Name" />
                                                            <asp:Parameter Name="EventDate" />
                                                            <asp:Parameter Name="EventTime" />
                                                            <asp:Parameter Name="VenueID" />
                                                            <asp:Parameter Name="Status" />
                                                            <asp:Parameter Name="CategoryID" />
                                                            <asp:Parameter Name="Description" />
                                                            <asp:Parameter Name="EventID" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </th>
            <th id="RightContent"></th>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" DeleteCommand="DELETE FROM [tblEvent] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO [tblEvent] ([Name], [EventDate], [EventTime], [VenueID], [Status], [CategoryID], [Description], [picture]) VALUES (@Name, @EventDate, @EventTime, @VenueID, @Status, @CategoryID, @Description, @picture)" SelectCommand="SELECT dbo.tblEventCategory.Name AS Category, tblEventCategory_1.Name AS SubCategory, dbo.tblEvent.Name, dbo.tblEvent.EventDate, dbo.tblEvent.EventTime, dbo.tblVenue.Name AS Venue, dbo.tblEvent.Status, dbo.tblEvent.EventID FROM dbo.tblEventCategory INNER JOIN dbo.tblVenue INNER JOIN dbo.tblEvent ON dbo.tblVenue.VenueID = dbo.tblEvent.VenueID INNER JOIN dbo.tblEventCategory AS tblEventCategory_1 ON dbo.tblEvent.CategoryID = tblEventCategory_1.EventCategoryID ON dbo.tblEventCategory.EventCategoryID = tblEventCategory_1.ParentCategoryID" UpdateCommand="UPDATE [tblEvent] SET [Name] = @Name, [EventDate] = @EventDate, [EventTime] = @EventTime, [VenueID] = @VenueID, [Status] = @Status, [CategoryID] = @CategoryID, [Description] = @Description, [picture] = @picture WHERE [EventID] = @EventID">
        <DeleteParameters>
            <asp:Parameter Name="EventID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Date" Name="EventDate" />
            <asp:Parameter DbType="Time" Name="EventTime" />
            <asp:Parameter Name="VenueID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="picture" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Date" Name="EventDate" />
            <asp:Parameter DbType="Time" Name="EventTime" />
            <asp:Parameter Name="VenueID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="picture" Type="String" />
            <asp:Parameter Name="EventID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

