<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="FoodDeliveryApp.UserHome" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="text-align:right;margin-top:5px" >
         <asp:Button ID="btnCart" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="Cart"  OnClick="btnCart_Click"
                                                       />
        <asp:Button ID="btnOrders" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="Orders"
                                                       />
         <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="Logout"  OnClick="btnLogout_Click"
                       style="align-self:end"                                />
    </div>
 <div class="jumbotron">
        <h1 id="userName" runat="server">Welcome User!! </h1>

      <asp:GridView ID="gvProducts" runat="server"  DataKeyNames="PID" AutoGenerateColumns="false" CssClass="gv" HeaderStyle-CssClass="gvHeader" FooterStyle-CssClass="gvHeader" Width="937px">
        <Columns>
            <asp:TemplateField HeaderText="ID" ItemStyle-Width="150px" Visible="false">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PID") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Products" ItemStyle-Width="60px" ItemStyle-CssClass="Name">
                <ItemTemplate>
                     <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Image ImageUrl='<%# Eval("Image") %>' runat="server" Height="240px" Width="250px" Style="display: normal"  />
                      
                        </td>
                        <td>
                            <table align="center" class="style5" style="border: thin solid black">
                                <tr>
                                    <td bgcolor="Green" class="style6" style="color: white">
                                        PRODUCT DETAIL</td>
                                </tr>
                                <tr>
                                    <td style="color: black">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="color: black">
&nbsp;&nbsp; Product Name :
                                        <asp:Label Text='<%# Eval("PName") %>' runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: black">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="color: black">
&nbsp;&nbsp; Product Price :
                                        <asp:Label Text='<%# Eval("Price") %>' runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: black">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="color: black">
&nbsp;&nbsp; Detail :
                                        <asp:Label ID="lbldetail" runat="server">Burger with fries and dip</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="style7">
                                            <tr>
                                                <td class="style8">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="ADD TO CART"  OnClick="btnAdd_Click"
                                                       />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="gvItem" />
    </asp:GridView>

        
    </div>

</asp:Content>