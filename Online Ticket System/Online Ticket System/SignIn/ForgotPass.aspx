<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="Online_Ticket_System.SignIn.FogotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <asp:Panel ID="Panel2" runat="server" DefaultButton="FGPaSubmit">
                    <div id="FgPassContent">
                        <div id="FgPassTitle">FORGOT YOUR PASSWORD</div>
                        <div style="text-align: left;">Please provided your username and email you provided during the register. We will send a link to reset your password.</div>
                        <table>
                            <tr>
                                <td id="fgpa3">
                                    <div>Username:</div>
                                </td>
                                <td id="rgpa4">
                                    <div>
                                        <asp:TextBox ID="FGPaUsername" runat="server" CssClass="FGPaBox" ValidationGroup="reset" ToolTip="Enter Username"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:RequiredFieldValidator ID="FGPaUsernameValidator" runat="server" ErrorMessage="Username is Required" ControlToValidate="FGPaUsername" ForeColor="#FF0066" ValidationGroup="reset"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="fgpa1">
                                    <div>Email:</div>
                                </td>
                                <td id="fgpa2">
                                    <div>
                                        <asp:TextBox ID="FGPaEmail" runat="server" CssClass="FGPaBox" ValidationGroup="reset" ToolTip="Enter Email"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:RequiredFieldValidator ID="FGPaEmailValidator" runat="server" ErrorMessage="Email is Required" ControlToValidate="FGPaEmail" ForeColor="#FF0066" ValidationGroup="reset"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="fgpa6">
                            <asp:Label ID="FGPaMessage" runat="server" ForeColor="#FF0066"></asp:Label>
                        </div>
                        <div id="fgpa8">
                            <asp:Button ID="FGPaSubmit" runat="server" Text="Submit" CssClass="FGPaSubmitButton" OnClick="FGPaSubmit_Click" ValidationGroup="reset" />
                        </div>
                    </div>
                </asp:Panel>

            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
