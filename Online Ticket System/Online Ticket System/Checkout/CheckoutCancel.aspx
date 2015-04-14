<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutCancel.aspx.cs" Inherits="$safeprojectname$.Checkout.CheckoutCancel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <h1>Checkout Cancelled</h1>
                <h3>Your purchase has been cancelled.</h3>
                <div>
                    <asp:Button ID="GoHome" runat="server" Text="Home" OnClick="GoHome_Click" />
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
