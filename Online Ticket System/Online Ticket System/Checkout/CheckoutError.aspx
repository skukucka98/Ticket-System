<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutError.aspx.cs" Inherits="$safeprojectname$.Checkout.CheckoutError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <h1>Checkout Error</h1>
                <p></p>
                <table id="ErrorTable">
                    <tr>
                        <td class="field"></td>
                        <td><%=Request.QueryString.Get("ErrorCode")%></td>
                    </tr>
                    <tr>
                        <td class="field"></td>
                        <td><%=Request.QueryString.Get("Desc")%></td>
                    </tr>
                    <tr>
                        <td class="field"></td>
                        <td><%=Request.QueryString.Get("Desc2")%></td>
                    </tr>
                </table>
                <p></p>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
