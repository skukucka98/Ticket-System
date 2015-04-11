<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="CreateE_Category.aspx.cs" Inherits="Online_Ticket_System.Create.CreateE_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="Content">
        <table>
            <tr>
                <th id="LeftContent"></th>
                <th id="CenterContent">
                    <div id="E_CatContent">
                        <div id="ManTitle">CREATE SUBCATEGORY</div>
                        <div id="C_sub">
                            <div style="text-decoration: underline; font-size: x-large">Category Type:</div>
                            <div>
                                <asp:DropDownList ID="CatType" runat="server" CssClass="SCDrDown" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" ValidationGroup="Sub_Cat"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [Name] FROM [tblEventCategory] WHERE ([ParentCategoryID] IS NULL)"></asp:SqlDataSource>
                            </div>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <div style="text-decoration: underline; font-size: x-large">Enter New Category Name:</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="SubCat" runat="server" CssClass="SCBox" ValidationGroup="Sub_Cat"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:RequiredFieldValidator ID="SubCatValidator" runat="server" ErrorMessage="*" ControlToValidate="SubCat" ForeColor="#FF0066" ValidationGroup="Sub_Cat"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="SubCatMess" runat="server" Font-Size="Medium"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:Button ID="SubCatButt" runat="server" Text="Submit" ValidationGroup="Sub_Cat" CssClass="SCButt" OnClick="SubCatBut_Click" /></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="text-decoration: underline; font-size: x-large">Current Category Information:</div>
                            <div id="Cur_SC">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div style="width:720px;height: 500px; overflow: auto;">
                                            <asp:GridView ID="CateGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="CateGridDataSource" GridLines="None" Width="700px" ValidationGroup="SCat" DataKeyNames="EventCategoryid" PageSize="5" OnRowCommand="CateGrid_RowCommand" OnRowUpdating="CateGrid_RowUpdating" ForeColor="#333333">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="EventCategoryid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="EventCategoryid" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="CatlogID" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="EventCategoryID" SelectedValue='<%# Bind("Categoryid") %>'></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" SelectCommand="SELECT [EventCategoryID], [Name] FROM [tblEventCategory] WHERE ([ParentCategoryID] IS NULL)"></asp:SqlDataSource>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="200px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="SubCategory" HeaderText="SubCategory" SortExpression="SubCategory" ItemStyle-Width="350px" ItemStyle-HorizontalAlign="left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle Width="400px" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Manage" ShowHeader="False">
                                                        <EditItemTemplate>
                                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CommandArgument='<%# Container.DataItemIndex %>' Text="Update" CssClass="SCButt" BackColor="Green" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to update the selected Category?')" />
                                                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="SCButt"/>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="SCButt" BackColor="#33ccff" ForeColor="White" />
                                                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="SCButt" OnClientClick="return confirm('Are you sure that you want to permanently delete the selected Category?')" ForeColor="White" BackColor="Red" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="CateGridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>"
                                                DeleteCommand="DELETE FROM [tblEventCategory] WHERE [EventCategoryID] = @EventCategoryID"
                                                InsertCommand="INSERT INTO [tblEventCategory] ([Name], [ParentCategoryID]) VALUES (@Name, @ParentCategoryID)"
                                                SelectCommand="SELECT c.EventCategoryid ,pc.eventcategoryid as categoryid, pc.name as Category, c.name as SubCategory FROM [tblEventCategory] c
                                                            INNER JOIN [tblEventCategory] pc on c.ParentCategoryid = pc.EventCategoryid"
                                                UpdateCommand="UPDATE [tblEventCategory] SET [ParentCategoryid] = @Catid, [Name] = @SubCategory WHERE [EventCategoryID] = @EventCategoryID">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="EventCategoryID" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Name" Type="String" />
                                                    <asp:Parameter Name="ParentCategoryID" Type="Int32" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="SubCategory" Type="String" />
                                                    <asp:Parameter Name="EventCategoryID" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </th>
                <th id="RightContent"></th>
            </tr>
        </table>
    </div>

</asp:Content>

