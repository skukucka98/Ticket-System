<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Ticket_System.SignIn.Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <th id="LeftContent"></th>
            <th id="CenterContent">
                <asp:Panel ID="panel2" runat="server" DefaultButton="RegisterButton">
                    <table>
                        <tr>
                            <td>
                                <div id="RegisterTitle">REGISTER</div>
                            </td>
                        </tr>
                        <tr>
                            <td id="RegisterInfo">
                                <table>
                                    <tr id="reg10">
                                        <td id="id3">Username:</td>
                                        <td>
                                            <div style="margin-bottom: 1px;">
                                                <asp:TextBox ID="UsernameReg" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter User Name 8-15 charater"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RegUsernameValidator" runat="server" ErrorMessage="*" ControlToValidate="UsernameReg" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td>
                                            <asp:Label ID="UnameVal" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label runat="server" Text="8-15 charater, uppercase, lowercase and number" Font-Size="X-Small" ForeColor="#CCCCCC"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg11">
                                        <td id="id4">Password:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="PasswordReg" runat="server" CssClass="RegBox" TextMode="Password" ValidationGroup="RegisterGroup" ToolTip="Enter Password With Atleast One Uppercase Letter"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RegPasswordValidator" runat="server" ErrorMessage="*" ForeColor="#FF0066" ControlToValidate="PasswordReg" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td>
                                            <asp:Label ID="PassVal" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>

                                    <tr id="reg12">
                                        <td id="id5">Re-Enter Password:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="ReEnterPasswordBox" runat="server" CssClass="RegBox" TextMode="Password" ValidationGroup="RegisterGroup" ToolTip="Re-Enter Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ReEnterPasswordValidator" runat="server" ErrorMessage="*" ControlToValidate="ReEnterPasswordBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="PasswordCompareValidator" runat="server" ErrorMessage="Password is not matched" ControlToCompare="PasswordReg" ControlToValidate="ReEnterPasswordBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup" Font-Size="XX-Small"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr id="reg1">
                                        <td id="id6">First name:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="FirstnameBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter First Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="LastnameValidator" runat="server" ErrorMessage="*" ControlToValidate="LastnameBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="reg2">
                                        <td id="id7">Last name:</td>
                                        <td>
                                            <div>

                                                <asp:TextBox ID="LastnameBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Last Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="FirstnameValidator" runat="server" ControlToValidate="FirstnameBox" ErrorMessage="*" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                                <br />
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg3">
                                        <td id="id8">Address1:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="Address1Box" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Valid Address"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Address1Validator" runat="server" ErrorMessage="*" ControlToValidate="Address1Box" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg4">
                                        <td id="id9">Address2:</td>
                                        <td>
                                            <div>
                                            <asp:TextBox ID="Address2Box" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Valid Address 2"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="reg5">
                                        <td id="id10">City:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="CityBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Valid City"></asp:TextBox><asp:RequiredFieldValidator ID="CityValidator" runat="server" ErrorMessage="*" ControlToValidate="CityBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg6">
                                        <td id="id11">State:</td>
                                        <td>
                                            <div>
                                                <asp:DropDownList ID="StateBox" runat="server" CssClass="RegDRList" ToolTip="Select State">
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
                                                <asp:RequiredFieldValidator ID="StateValidator" runat="server" ErrorMessage="*" ControlToValidate="StateBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>

                                                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="StateBox1" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup"></asp:TextBox>
                                                        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
                                                        <cc1:DropDownExtender ID="StateBox_DropDownExtender" runat="server" DropDownControlID="ListBox1" HighlightBackColor="WhiteSmoke" TargetControlID="StateBox">
                                                        </cc1:DropDownExtender>
                                                        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListBox_SelectedIndexChanged" Style="display: none; visibility: hidden;"></asp:ListBox>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>--%>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg7">
                                        <td id="id12">ZipCode:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="ZipcodeBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Valid Zip Code"></asp:TextBox><asp:RequiredFieldValidator ID="ZipcodeValidator" runat="server" ErrorMessage="*" ControlToValidate="ZipcodeBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg8">
                                        <td id="id13">Phone Number:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="PhoneBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Phone Number"></asp:TextBox><asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="*" ControlToValidate="PhoneBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="reg9">
                                        <td id="id14">Email:</td>
                                        <td>
                                            <div>
                                                <asp:TextBox ID="EmailBox" runat="server" CssClass="RegBox" ValidationGroup="RegisterGroup" ToolTip="Enter Valid Email"></asp:TextBox><asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*" ControlToValidate="EmailBox" ForeColor="#FF0066" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                                <div>
                                    <asp:Label ID="RegMes" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                                </div>
                                <div id="reg13">
                                    <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="LoginButton" ValidationGroup="RegisterGroup" OnClick="RegisterButton_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </th>
            <th id="RightContent"></th>
        </tr>
    </table>
</asp:Content>
