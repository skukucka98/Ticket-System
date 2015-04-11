<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="E_DetailErr.aspx.cs" Inherits="Online_Ticket_System.Display.E_DetailErr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="LeftContent"></td>
            <td id="CenterContent">
                <div>
                    <h3 style="margin: 0px; font-family: arial, helvetica, FreeSans, 'Nimbus Sans L', Garuda, Utkal, sans-serif; padding: 0px; font-weight: bold; display: block; font-size: 14px; color: red; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Sorry, but this event no longer exists in our database.</h3>
                </div>
                <br />
                <div>
                    <table style="margin-left:auto; margin-right:auto">
                        <tr>
                            <th style="background-color:#808080;color:white">Ticket Not Available</th>
                        </tr>
                        <tr>
                            <td>Tickets are currently not available online for one of the following reasons:
                               <ul>
                                   <li>Tickets may not be on sale yet</li>
                                   <li>Tickets may not be available at this time. More tickets may become available later</li>
                                   <li>Tickets may not be available online just hours before an event occurs</li>
                               </ul>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="RightContent"></td>
        </tr>
    </table>
</asp:Content>
