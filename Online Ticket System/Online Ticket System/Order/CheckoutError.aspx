﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutError.aspx.cs" Inherits="Online_Ticket_System.Order.CheckoutError" %>

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
                            <th id="ManTitle" style="background-color: black; color: white">Checkout Error</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Checkoutmess" runat="server" Text="Invalid Order" ForeColor="Yellow"></asp:Label>
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
