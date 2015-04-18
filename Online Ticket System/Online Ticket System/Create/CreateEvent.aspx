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
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Invalid Date Format" ControlToValidate="txtEventDate" ValidationGroup="AddEvent" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Time:</td>
                                <td style="width: 495px; text-align: left">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtEventTime" runat="server" Width="300px" ValidationGroup="AddEvent" TargetControlID="txtEventTime" CssClass="CrBox"></asp:TextBox>
                                            <cc1:DropDownExtender ID="txtEventTime_DropDownExtender" runat="server" TargetControlID="txtEventTime" DropDownControlID="ListBox1">
                                            </cc1:DropDownExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEventTime" ErrorMessage="*" ValidationGroup="AddEvent" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:ListBox ID="ListBox1" runat="server" Style="display: none; visibility: hidden;" AutoPostBack="true" OnSelectedIndexChanged="ListBox_SelectedIndexChanged" Width="300px">
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
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Invalid Time Format" ControlToValidate="txtEventTime" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="AddEvent"></asp:CustomValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Venue:</td>
                                <td class="auto-style2" style="text-align: left">
                                    <div>
                                        <asp:DropDownList ID="VenueIDDd" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="VenueID" ValidationGroup="AddEvent" AutoPostBack="True" CssClass="CrDrDown" Width="305px" Height="35px"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [VenueID], [Name] FROM [tblVenue]"></asp:SqlDataSource>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Section Info:</td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>Seat Level</td>
                                            <td>Price</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="SeatDropDown" runat="server" DataSourceID="SqlDataSource8" DataTextField="Section" DataValueField="Section" CssClass="CrSmallDrDown" Width="80px">
                                                    <asp:ListItem Selected="True" Value="Please Select Seat level">Please Select Seat level</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [Section], [ID] FROM [tblVenueInfo] WHERE ([VenueID] = @VenueID)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="VenueIDDd" Name="VenueID" PropertyName="SelectedValue" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrice" runat="server" Width="80px" ValidationGroup="AddPrice" CssClass="btnstandard" Height="25px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPrice" ValidationGroup="AddPrice"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:Button ID="price" runat="server" Text="Add" OnClick="price_Click" CssClass="CrEButt" ValidationGroup="AddPrice" Height="35px" Width="80px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lbPrice" runat="server"></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:GridView ID="EventGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="EventGrid_RowDeleting">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="SeatSection" HeaderText="Section" />
                                                        <asp:BoundField DataField="TotalSeat" HeaderText="Total Seat" />
                                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btnstandard" ForeColor="white" BackColor="Red" Height="30px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--                            <tr>
                                <td style="width: 200px; text-align: right">Seat level:</td>
                                <td class="auto-style2" style="text-align: left">
                                    <div>
                                        Price
                                        <asp:Label ID="lbPrice" runat="server"></asp:Label>
                                    </div>
                                </td>
                            </tr>
s                            <tr>
                                <td></td>
                                <td>
                                    <div id="gridevent" runat="server">
                                    </div>
                                </td>
                            </tr>--%>
                            <tr>
                                <td style="width: 200px; text-align: right">Category:</td>
                                <td style="width: 495px; text-align: left">

                                    <asp:DropDownList ID="SelectEventCategory" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="EventCategoryID" ValidationGroup="AddEvent" CssClass="CrDrDown" Width="305px" Height="35px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [EventCategoryID], [Name] FROM [tblEventCategory] WHERE ([ParentCategoryID] IS NOT NULL)"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Image:</td>
                                <td style="width: 495px; text-align: left">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    <%--<asp:Button ID="btnUploadImage" runat="server" Text="Upload" OnClick="btnUploadImage_Click1" CssClass="CrEButt" />--%>
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
                                    <asp:Button ID="buttonSave" runat="server" Text="Save" OnClick="buttonSave_Click" ValidationGroup="AddEvent" CssClass="CrEButt" Height="40px" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left">
                                    <asp:Label ID="lbOutPut" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <h2 style="text-align: left">Event Management</h2>
                            <div style="height: 500px; overflow: auto; width: 845px">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
                                            GridLines="None" DataKeyNames="Eventid" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
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
                                                    <ControlStyle Width="150px" />

                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:d}" />
                                                <asp:BoundField DataField="EventTime" HeaderText="EventTime" SortExpression="EventTime" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="200px" />
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
                            </div>

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
                                                <div style="font-size: large; margin-bottom: 10px; margin-top: 10px;">Event Detail</div>
                                                <div>
                                                    <asp:DetailsView ID="eDetails" runat="server"
                                                        AutoGenerateRows="False"
                                                        BackColor="White" BorderStyle="None"
                                                        CellPadding="3" DataSourceID="SqlDataSource4"
                                                        GridLines="Horizontal" Height="50px" Width="590px" DataKeyNames="EventID" HorizontalAlign="Center" BorderColor="#E7E7FF" BorderWidth="1px" OnItemDeleted="eDetails_ItemDeleted" OnItemUpdated="eDetails_ItemUpdated">
                                                        <AlternatingRowStyle BackColor="#F7F7F7" />
                                                        <CommandRowStyle HorizontalAlign="Left" />
                                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Left" />
                                                        <FieldHeaderStyle HorizontalAlign="Left" Width="120px" />
                                                        <RowStyle HorizontalAlign="Left" BackColor="#EEEEEE" ForeColor="Black" />
                                                        <Fields>
                                                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Name") %>' CssClass="btnstandard" Width="250px"></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EventDate" SortExpression="EventDate">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EventDate", "{0:d}") %>' CssClass="btnstandard" Width="250px"></asp:TextBox>
                                                                    <asp:CustomValidator ID="CustomValidator3" runat="server"
                                                                        ControlToValidate="TextBox5"
                                                                        ErrorMessage="InValid Date Format"
                                                                        ForeColor="Red" OnServerValidate="CustomValidator3_ServerValidate">
                                                                    </asp:CustomValidator>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EventDate", "{0:d}") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EventDate", "{0:d}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EventTime" SortExpression="EventTime">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EventTime") %>' CssClass="btnstandard" Width="250px"></asp:TextBox>
                                                                    <asp:CustomValidator ID="CustomValidator"
                                                                        runat="server"
                                                                        ErrorMessage="Invalid Time Format"
                                                                        ControlToValidate="TextBox4"
                                                                        ForeColor="Red" OnServerValidate="CustomValidator_ServerValidate"></asp:CustomValidator>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EventTime") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EventTime") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Venue" SortExpression="Venue">
                                                                <EditItemTemplate>
                                                                    <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Venue") %>'></asp:TextBox>--%>
                                                                    <%--                                                                    <asp:DropDownList ID="TextBox3" runat="server" SelectedValue='<%# Bind("Venue") %>' DataSourceID="SqlDataSource5" DataTextField="Venue" DataValueField="Venue" CssClass="btnstandard" Width="250px"></asp:DropDownList>--%>
                                                                    <asp:Label ID="Label3_1" runat="server" Text='<%# Bind("Venue") %>'></asp:Label>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Venue") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Venue") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="SubCategory" SortExpression="SubCategory">
                                                                <EditItemTemplate>
                                                                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubCategory") %>'></asp:TextBox>--%>
                                                                    <asp:DropDownList ID="TextBox2" runat="server" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("SubCategory") %>' DataTextField="SubCategory" DataValueField="SubCategory" CssClass="btnstandard" Width="250px"></asp:DropDownList>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubCategory") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubCategory") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Status" SortExpression="status">
                                                                <EditItemTemplate>
                                                                    <%--<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>--%>
                                                                    <asp:DropDownList ID="TextBox7" runat="server" SelectedValue='<%# Bind("status") %>' CssClass="btnstandard" Width="250px">
                                                                        <asp:ListItem>Available</asp:ListItem>
                                                                        <asp:ListItem>Unavailable</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="picture" SortExpression="picture">
                                                                <EditItemTemplate>
                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' CssClass="btnstandard" Width="250px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <EditItemTemplate>
                                                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="C_PTButt" BackColor="Green" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to update this event?')" />
                                                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="C_PTButt" />
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="C_PTButt" BackColor="#33ccff" ForeColor="White" />
                                                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Deactivate" CssClass="C_PTButt" BackColor="Red" ForeColor="White" Width="100px" OnClientClick="return confirm('Are you sure that you want to deactivate this event?')" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Fields>
                                                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" DeleteCommand="UPDATE dbo.tblEvent SET isActive = 0
WHERE (EventID = @EventID)"
                                                        SelectCommand="SELECT EventID, e.Name, EventDate, EventTime, v.name as Venue, c.name as SubCategory, e.Description, e.status , e.[picture]
FROM dbo.tblEvent e
                                                                                                INNER JOIN dbo.tblVenue v on v.Venueid = e.Venueid 
                                                                                                INNER JOIN dbo.tblEventCategory c on c.EventCategoryid = e.Categoryid
                                                                                                WHERE (EventID = @EventID)"
                                                        UpdateCommand="UPDATE dbo.tblEvent SET Name = @Name
                                                                        , EventDate = @EventDate
                                                                        , EventTime = @EventTime
                                                                        , VenueID = (Select Venueid from tblvenue where Name = @Venue)
                                                                        , Status = @Status
                                                                        , CategoryID = (Select EventCategoryid from tblEventCategory where Name = @SubCategory)
                                                                        , Description = @Description 
                                                                        WHERE (EventID = @EventID)">
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
                                                            <asp:Parameter Name="Venue" />
                                                            <asp:Parameter Name="Status" />
                                                            <asp:Parameter Name="SubCategory" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>"
        DeleteCommand="DELETE FROM [tblEvent] WHERE [EventID] = @EventID"
        InsertCommand="INSERT INTO [tblEvent] ([Name], [EventDate], [EventTime], [VenueID], [Status], [CategoryID], [Description], [picture]) VALUES (@Name, @EventDate, @EventTime, @VenueID, @Status, @CategoryID, @Description, @picture)"
        SelectCommand="SELECT dbo.tblEventCategory.Name AS Category, tblEventCategory_1.Name AS SubCategory, dbo.tblEvent.Name, dbo.tblEvent.EventDate, dbo.tblEvent.EventTime, dbo.tblVenue.Name AS Venue, dbo.tblEvent.Status, dbo.tblEvent.EventID FROM dbo.tblEventCategory INNER JOIN dbo.tblVenue INNER JOIN dbo.tblEvent ON dbo.tblVenue.VenueID = dbo.tblEvent.VenueID INNER JOIN dbo.tblEventCategory AS tblEventCategory_1 ON dbo.tblEvent.CategoryID = tblEventCategory_1.EventCategoryID ON dbo.tblEventCategory.EventCategoryID = tblEventCategory_1.ParentCategoryID
WHERE dbo.tblEvent.isActive = 1"
        UpdateCommand="UPDATE [tblEvent] SET [Name] = @Name, [EventDate] = @EventDate, [EventTime] = @EventTime, [VenueID] = @VenueID, [Status] = @Status, [CategoryID] = @CategoryID, [Description] = @Description, [picture] = @picture WHERE [EventID] = @EventID">
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
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
        ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>"
        SelectCommand="SELECT [Name] As Venue FROM [tblVenue]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
        ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>"
        SelectCommand="SELECT [Name] as SubCategory FROM [tblEventCategory] WHERE ([ParentCategoryID] IS NOT NULL)"></asp:SqlDataSource>

</asp:Content>

