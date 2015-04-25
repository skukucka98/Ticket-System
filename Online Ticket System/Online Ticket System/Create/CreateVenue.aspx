<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="CreateVenue.aspx.cs" Inherits="Online_Ticket_System.Create.CreateVenue" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div id="Cr_VenueContent">
                    <div id="ManTitle">CREATE NEW VENUE</div>
                    <div id="CRV_detail">
                        <table class="venue">
                            <tr>
                                <td style="width: 200px; text-align: right">Venue Name:</td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtvenueName" runat="server" Width="330px" ValidationGroup="AddVenue" Height="24px" CssClass="CRVBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtvenueName" ErrorMessage="*" ValidationGroup="AddVenue" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">Address 1:</td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtaddress1" runat="server" Width="330px" ValidationGroup="AddVenue" CssClass="CRVBox"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtaddress1" ErrorMessage="*" ValidationGroup="AddVenue" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">Address 2:</td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtaddress2" runat="server" Width="330px" ValidationGroup="AddVenue" CssClass="CRVBox"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">City:</td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtCity" runat="server" Width="330px" ValidationGroup="AddVenue" CssClass="CRVBox"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCity" ErrorMessage="*" ValidationGroup="AddVenue" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">State:</td>
                                <td style="width: 495px">
                                    <asp:DropDownList ID="txtState" runat="server" CssClass="CRVDrDown" Width="335px">
                                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                        <asp:ListItem Value="AK">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="CA">California</asp:ListItem>
                                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                        <asp:ListItem Value="MN">Minesota</asp:ListItem>
                                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                    </asp:DropDownList>
                                    <%-- <asp:TextBox ID="txtState1" runat="server" Width="300px" ValidationGroup="AddVenue" CssClass="CRVBox"></asp:TextBox>
                                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
                                    <cc1:DropDownExtender ID="txtState_DropDownExtender" runat="server" TargetControlID="txtState" DropDownControlID="ListBox1" HighlightBackColor="WhiteSmoke">
                                    </cc1:DropDownExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtState" ErrorMessage="*" ValidationGroup="Cr_Venue" ForeColor="Red"></asp:RequiredFieldValidator>

                                    <asp:ListBox ID="ListBox1" runat="server" Style="display: none; visibility: hidden;" AutoPostBack="true" OnSelectedIndexChanged="ListBox_SelectedIndexChanged" CssClass="CRVBox" Height="150px">
                                        
                                    </asp:ListBox>--%>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">Zip Code:</td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtZip" runat="server" Width="330px" ValidationGroup="AddVenue" CssClass="CRVBox" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtZip" ErrorMessage="*" ValidationGroup="AddVenue" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 200px; text-align: right">Add Seat Section:</td>
                                <td style="width: 495px">
                                    <table>
                                        <tr>
                                            <td>Section #:</td>
                                            <td>Total Seat:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSeatSection" runat="server" Width="109px" ValidationGroup="AddSSection" CssClass="CRVBox" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtSeatSection" ErrorMessage="*" ValidationGroup="AddSSection" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTotalSeat" runat="server" Width="109px" ValidationGroup="AddSSection" CssClass="CrSmalBox" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalSeat" ErrorMessage="*" ValidationGroup="AddSSection" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:Button ID="AddSeat" runat="server" Text="Add" OnClick="AddSeat_Click" ValidationGroup="AddSSection" CssClass="CRVButt" Height="35px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lbSeatOutput" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div class="grid" runat="server" id="vengrid">
                                        <asp:GridView ID="VenueGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="VenueGrid_RowDeleting" Width="330px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="SeatSection" HeaderText="Section" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField DataField="TotalSeat" HeaderText="Total Seat" ItemStyle-HorizontalAlign="Center" />
                                                <asp:TemplateField HeaderText="Manage" ShowHeader="False">
                                                    <%--                                                    <EditItemTemplate>
                                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CommandArgument='<%# Eval("SeatSection") %>' />
                                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                    </EditItemTemplate>--%>
                                                    <ItemTemplate>
                                                        <%--<asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CommandArgument='<%# Eval("SeatSection") %>' />--%>
                                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("SeatSection") %>' OnClientClick="return confirm('Are you sure that you want to permanently delete this venue section?')" />
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
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Seating Chart:</td>
                                <td style="width: 495px; text-align: left; height:20px">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>

                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: right">Description: </td>
                                <td style="width: 495px">
                                    <asp:TextBox ID="txtvenueDescription" runat="server" Width="330px" ValidationGroup="AddVenue" CssClass="CRVBox" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Label ID="venueOutput" runat="server"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="margin-top: 10px;">
                                    <asp:Button ID="venueSave" runat="server" OnClick="venueSave_Click" Text="Save" ValidationGroup="AddVenue" CssClass="CRVButt" Width="100px" Height="35px" /></td>
                            </tr>

                        </table>
                    </div>
                </div>
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <h2>Venue Management</h2>
                            <div style="height: 500px; overflow: auto">
                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="VenueID" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Detail" />
                                            </ItemTemplate>
                                            <ControlStyle CssClass="btnstandard" Height="35px" Width="80px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>

                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:Panel ID="Panel1" runat="server" CssClass="Popup">
                    <div style="background-color: lightgray">
                        <div style="position: relative; margin-bottom: 3px; top: 3px; margin-right: 10px; text-align: right;">
                            <asp:Button ID="CloseBtn" runat="server" Text="X" CssClass="lbl" />
                            <cc1:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="CloseBtn" PopupControlID="panel1" CancelControlID="CloseBtn" BackgroundCssClass="jsMpeBackground">
                            </cc1:ModalPopupExtender>
                        </div>
                        <div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div style="max-height: 500px; overflow: auto; margin-left: 5px; margin-right: auto">
                                        <%--<h3 style="text-decoration: underline">Venue Detail</h3>--%>
                                        <asp:DetailsView ID="VenDetail" runat="server" Height="50px" Width="590px"
                                            AutoGenerateRows="False" DataSourceID="SqlDataSource2"
                                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
                                            BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                                            DataKeyNames="VenueID"
                                            OnItemUpdated="VenDetail_ItemUpdated"
                                            OnItemDeleted="VenDetail_ItemDeleted">
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                            <EditRowStyle Font-Bold="True" ForeColor="Black" Width="500px" />
                                            <Fields>
                                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Name") %>' CssClass="btnstandard" Width="300px" Height="20px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <%--<ControlStyle CssClass="btnstandard" Height="30px" Width="300px" />--%>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Address1" SortExpression="Address1">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address1") %>' CssClass="btnstandard" Width="300px" Height="20px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address1") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Address1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <%--<ControlStyle CssClass="btnstandard" Height="30px" Width="300px" />--%>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" ControlStyle-CssClass="btnstandard" ControlStyle-Width="300px" ControlStyle-Height="20px">
                                                    <ControlStyle CssClass="btnstandard" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="City" SortExpression="City">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("City") %>' CssClass="btnstandard" Width="300px" Height="20px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server"
                                                            ErrorMessage="Invalid City"
                                                            ControlToValidate="TextBox2"
                                                            ForeColor="Red"
                                                            OnServerValidate="TextValidate"></asp:CustomValidator>

                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="State" SortExpression="State">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="TextBox1" runat="server" SelectedValue='<%# Bind("State") %>' Width="303px" Height="30px" CssClass="btnstandard">
                                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                                            <asp:ListItem Value="AK">Arkansas</asp:ListItem>
                                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                                            <asp:ListItem Value="MN">Minesota</asp:ListItem>
                                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ZipCode") %>' CssClass="btnstandard" Width="300px" Height="20px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="CustomValidator" runat="server"
                                                            ErrorMessage="Invalid Zipcode"
                                                            ControlToValidate="TextBox3"
                                                            ForeColor="Red"
                                                            OnServerValidate="CustomValidator_ServerValidate">
                                                        </asp:CustomValidator>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Venue Info">
                                                    <EditItemTemplate>
                                                        <asp:GridView ID="VeninfoDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="400px" ShowFooter="True">
                                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                            <Columns>
                                                                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SeatTotal" HeaderText="SeatTotal" SortExpression="SeatTotal" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Manage" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                                    <EditItemTemplate>
                                                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="C_PTButt" BackColor="Green" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to update this venue?')" />
                                                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="C_PTButt" />
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="C_PTButt" BackColor="#33ccff" ForeColor="White" />
                                                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="C_PTButt" BackColor="Red" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to permanently delete this venue?')" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>

                                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                            <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

                                                            <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                                                            <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                                                            <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                                                            <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                                                        </asp:GridView>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:GridView ID="Ven_infoDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="300px">
                                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                            <Columns>
                                                                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SeatTotal" HeaderText="SeatTotal" SortExpression="SeatTotal" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                            </Columns>

                                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                            <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

                                                            <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                                                            <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                                                            <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                                                            <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                                                        </asp:GridView>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SeatDiagram" SortExpression="SeatDiagram">
                                                    <EditItemTemplate>
                                                        <%--                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("SeatDiagram") %>'></asp:TextBox>--%>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("SeatDiagram") %>'></asp:Label>

                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("SeatDiagram") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("SeatDiagram") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="btnstandard" Height="20px" Width="300px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Height="100px" Width="300px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="btnstandard" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="C_PTButt" BackColor="Green" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to update this venue?')" OnClick="Page_Load" />
                                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="C_PTButt" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="C_PTButt" BackColor="#33ccff" ForeColor="White" />
                                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="C_PTButt" BackColor="Red" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to permanently delete this venue?')" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Fields>
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                        </asp:DetailsView>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </asp:Panel>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" DeleteCommand="DELETE FROM [tblVenue] WHERE [VenueID] = @VenueID" InsertCommand="INSERT INTO [tblVenue] ([Name], [Address1], [Address2], [City], [State], [ZipCode], [Description]) VALUES (@Name, @Address1, @Address2, @City, @State, @ZipCode, @Description)" SelectCommand="SELECT * FROM [tblVenue]" UpdateCommand="UPDATE [tblVenue] SET [Name] = @Name, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Description] = @Description WHERE [VenueID] = @VenueID">
        <DeleteParameters>
            <asp:Parameter Name="VenueID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="VenueID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT * FROM [tblVenue] WHERE ([VenueID] = @VenueID)" DeleteCommand="DELETE FROM [tblVenue] WHERE [VenueID] = @VenueID
DELETE FROM [tblVenueinfo] WHERE [VenueID] = @VenueID"
        InsertCommand="INSERT INTO [tblVenue] ([Name], [Address1], [Address2], [City], [State], [ZipCode], [Description], [SeatDiagram]) VALUES (@Name, @Address1, @Address2, @City, @State, @ZipCode, @Description, @SeatDiagram)" UpdateCommand="UPDATE [tblVenue] SET [Name] = @Name, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Description] = @Description, [SeatDiagram] = @SeatDiagram WHERE [VenueID] = @VenueID">
        <DeleteParameters>
            <asp:Parameter Name="VenueID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="SeatDiagram" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="VenueID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="SeatDiagram" Type="String" />
            <asp:Parameter Name="VenueID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" DeleteCommand="DELETE FROM [tblVenueInfo] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblVenueInfo] ([VenueID], [Section], [SeatTotal]) VALUES (@VenueID, @Section, @SeatTotal)" SelectCommand="SELECT * FROM [tblVenueInfo] WHERE ([VenueID] = @VenueID)" UpdateCommand="UPDATE [tblVenueInfo] SET [Section] = @Section, [SeatTotal] = @SeatTotal WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VenueID" Type="Int32" />
            <asp:Parameter Name="Section" Type="Int32" />
            <asp:Parameter Name="SeatTotal" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="VenueID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Section" Type="Int32" />
            <asp:Parameter Name="SeatTotal" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

