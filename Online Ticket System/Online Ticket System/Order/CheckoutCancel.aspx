<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutCancel.aspx.cs" Inherits="Online_Ticket_System.Order.CheckoutCancel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent" style="background-color:black; color:white">
                <div>
                    <table style="margin-left: auto; margin-right: auto; width:700px; text-align:center">
                        <tr>
                            <th id="ManTitle" style="background-color:black">Your order has been cancelled</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Return to Home page" CssClass="btnstandard" Height="40px" Width="150px" Font-Bold="true" ForeColor="White" BackColor="Blue" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
