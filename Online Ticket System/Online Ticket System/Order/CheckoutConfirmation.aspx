<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutConfirmation.aspx.cs" Inherits="Online_Ticket_System.Order.CheckoutConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div>
                    <table style="margin-left: auto; margin-right: auto; width: 700px; text-align: center; margin-top: 20px">
                        <tr>
                            <th id="ManTitle">Order Confirmation</th>
                        </tr>
                        <tr>
                            <td style="color: green">You have successfully completed your payment!
                                <br />
                                This is the confirmation code for this order.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="font-size: xx-large; border: solid thick; width: 400px; margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px">
                                    <asp:Label ID="ConfirmationCodelb" runat="server"></asp:Label>
                                    <br />
                                    <div style="font-size:medium; margin-top:20px">
                                        Purchase Date:
                                        <asp:Label ID="PurchaseDate" runat="server" Font-Size="Medium"></asp:Label>
                                    </div>
                                </div>
                            </td>
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
