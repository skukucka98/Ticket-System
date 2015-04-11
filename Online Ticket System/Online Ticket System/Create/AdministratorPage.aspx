<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdministratorPage.aspx.cs" Inherits="Online_Ticket_System.Create.AdministratorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div id="Content">
            <table>
                <tr>
                    <td id="LeftContent"></td>
                    <td id="CenterContent">
                        <div>CREATE</div>
                        <div>                            
                                <ul>
                                    <li><a href="CreateE_Category.aspx">Create Category</a></li>
                                    <li><a href="CreateVenue.aspx">Create Venue</a></li>
                                    <li><a href="CreateP_Type.aspx">Create Payment Type</a></li>
                                    <li><a href="CreateEvent.aspx">Create Event</a></li>
                                </ul>
                        </div>
                        </td>
                    <td id="RightContent"></td>
                </tr>
            </table>
        </div>
</asp:Content>


