<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Online_Ticket_System.SignIn.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div id="FgPassContent">
                    <asp:Panel ID="panel2" runat="server" DefaultButton="RePaSubmit">
                        <div id="ResetPassTitle">RESET PASSWORD</div>
                        <table>
                            <tr>
                                <td></td>
                                <td><div style="text-align:center; margin-bottom:1px"><asp:Label runat="server" Text="8-15 charater, uppercase, lowercase and number" Font-Size="X-Small" ForeColor="#CCCCCC"></asp:Label></div></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td id="repa1">
                                    <div>New Password:</div>
                                </td>
                                <td id="repa2">
                                    <div>
                                        <asp:TextBox ID="RePass" runat="server" CssClass="ResetBox" ValidationGroup="reset" TextMode="Password" ToolTip="Enter New Password"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RePassValidator" runat="server" ErrorMessage="Required" ControlToValidate="RePass" ForeColor="#FF0066" ValidationGroup="reset" Font-Size="Small"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="repa3">
                                    <div>New Password Confirmation:</div>
                                </td>
                                <td id="repa4">
                                    <div>
                                        <asp:TextBox ID="RePaConfirm" runat="server" ValidationGroup="reset" CssClass="ResetBox" TextMode="Password" ToolTip="Re-Enter New Password"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RePassConfirmValidator" runat="server" ErrorMessage="Required" ControlToValidate="RePaConfirm" ForeColor="#FF0066" ValidationGroup="reset" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="RePass" ControlToValidate="RePaConfirm" ErrorMessage="Password is not match" Font-Size="Small" ForeColor="Red" ValidationGroup="reset"></asp:CompareValidator>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="repa6">
                            <asp:Label ID="RePaMessage" runat="server" ForeColor="#FF0066" Font-Size="Small"></asp:Label>
                        </div>
                        <div id="repa8">
                            <asp:Button ID="RePaSubmit" runat="server" Text="Reset" CssClass="ResetButton" OnClick="RePaSubmit_Click" ValidationGroup="reset" />
                            <asp:Button ID="RePaCancel" runat="server" Text="Cancel" CssClass="ResetButton" OnClick="RePaCancel_Click" />
                        </div>
                    </asp:Panel>
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
