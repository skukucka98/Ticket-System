<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Ticket_System.SignIn.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="LoginButton">
        <table>
            <tr>
                <td id="LoginContent">
                    <table>
                        <tr>
                            <td id="LoginTitle">LOGIN</td>
                        </tr>
                        <tr>
                            <td id="LoginInfo">
                                <asp:Panel ID="Panel2" runat="server" DefaultButton="LoginButton">
                                    <table>
                                        <tr id="lg1">
                                            <td id="id1">Username:</td>
                                            <td>
                                                <asp:TextBox ID="UsernameBox" runat="server" CssClass="LoginBox" ValidationGroup="LoginGroup" ToolTip="Enter Username"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="*" ForeColor="#FF0066" ControlToValidate="UsernameBox" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator></td>
                                        </tr>
                                        <tr id="lg2">
                                            <td id="id2">Password:</td>
                                            <td>
                                                <asp:TextBox ID="PasswordBox" runat="server" CssClass="LoginBox" TextMode="Password" ValidationGroup="LoginGroup" ToolTip="Enter Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="*" ForeColor="#FF0066" ControlToValidate="PasswordBox" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td id="ForgotPassword">
                                                <asp:LinkButton ID="ForgotPass" runat="server" OnClick="ForgotPass_Click">Forgot Password</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Label ID="LoginMessage" runat="server" ForeColor="#FF0066" Font-Size="Small"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <div id="lg4">
                                        <asp:Button ID="LoginButton" runat="server" Text="LogIn" CssClass="LoginButton" ValidationGroup="LoginGroup" OnClick="LoginButton_Click" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
                <td id="RegisterSuggestionContent">
                    <div>Don't have an Account?</div>
                    <div>
                        <asp:Button ID="RequestRegister" runat="server" Text="Register" CssClass="LoginButton" OnClick="RequestRegister_Click" ValidationGroup="RegGroup" />
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
