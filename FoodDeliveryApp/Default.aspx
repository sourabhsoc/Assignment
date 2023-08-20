<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodDeliveryApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome to Online Food Delivery Application</h1>
        <p class="lead">A platform to order your favourite food online, from across the city restaurants.</p>
        <p><a runat="server" href="~/Login" class="btn btn-primary btn-lg">Login &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
           <img src="Images/sample_image.jpg" style="height:200px" />
        </div>
        <div class="col-md-4">
           <img src="Images/sample_image.jpg" style="height:200px" />
        </div>
         <div class="col-md-4">
           <img src="Images/sample_image.jpg" style="height:200px" />
        </div>
<%--        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>--%>
    </div>

</asp:Content>
