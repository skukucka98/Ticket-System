<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="CreateP_Type.aspx.cs" Inherits="Online_Ticket_System.Create.CreateP_Method" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Panel ID="Panel2" runat="server" DefaultButton="C_PTButt">
        <table>
            <tr>
                <th id="LeftContent"></th>
                <th id="CenterContent">
                    <div id="P_TypeContent">
                        <div style="background-color: lightyellow; font-size: 40px;">CREATE NEW PAYMENT TYPE</div>
                        <div id="PT_Detail">
                            <div style="text-decoration: underline; font-size: x-large">Payment Type Name:</div>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="C_PtName" runat="server" ValidationGroup="C_PT" CssClass="C_PTBox"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="CPTNameValidator" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="C_PT" ControlToValidate="C_PtName"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="C_PTMess" runat="server" Font-Size="XX-Small" ForeColor="Red"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="C_PTButt" runat="server" Text="Submit" ValidationGroup="C_PT" CssClass="C_PTButt" OnClick="C_PTButt_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div style="text-decoration: underline; font-size: x-large">Current Payment Type:</div>
                            <div>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PaymentTypeID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="PaymentTypeID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="PaymentTypeID">
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="Payment Type" SortExpression="Name">
                                            <ItemStyle HorizontalAlign="Center" Width="600px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Manage" ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="C_PTButt" BackColor="Green" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to update the selected Payment Type?')"></asp:Button>
                                                <asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="C_PTButt"></asp:Button>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="C_PTButt" BackColor="#33ccff" ForeColor="White"></asp:Button>
                                                <asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="C_PTButt" BackColor="Red" ForeColor="White" OnClientClick="return confirm('Are you sure that you want to permanently delete the selected Payment Type?')"></asp:Button>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TicketDBConnectionString %>" 
                                    DeleteCommand="DELETE FROM [tblPaymentType] WHERE [PaymentTypeID] = @PaymentTypeID" 
                                    InsertCommand="INSERT INTO [tblPaymentType] ([Name]) VALUES (@Name)" 
                                    SelectCommand="SELECT * FROM [tblPaymentType] ORDER BY [PaymentTypeID]" 
                                    UpdateCommand="UPDATE [tblPaymentType] SET [Name] = @Name WHERE [PaymentTypeID] = @PaymentTypeID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="PaymentTypeID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Name" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="PaymentTypeID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </th>
                <th id="RightContent"></th>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

