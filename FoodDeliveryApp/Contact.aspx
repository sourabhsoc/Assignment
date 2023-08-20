<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FoodDeliveryApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Sourabh Gupta</h3>
    <address>
        Address 1<br />
        Gurgaon, 122006<br />
        <abbr title="Phone">P:</abbr>
        0124 222333
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:sourabh.gupta@example.com">sourabh.gupta@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
