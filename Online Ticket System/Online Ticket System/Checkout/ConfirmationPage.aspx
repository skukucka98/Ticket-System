<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="$safeprojectname$.Checkout.ConfirmationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label2" runat="server" Text="Transaction Id:" CssClass="auto-style1"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="auto-style1"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Purchase Date:"></asp:Label>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Text="Label"></asp:Label>
        <br />
        <br />
    </asp:Panel>
</asp:Content>
